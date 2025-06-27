#!/usr/bin/env bash

# TODO: sync pixiv bookmarks / works

# ------------------------------- Configuration -------------------------------

dir_path="$(dirname "$(realpath "$0")")"
temp_path="$HOME/.cache/sync-archive"

# source = <absolute path>
source_path="$(sed -ne 's/^source *= *\(.\)/\1/p' \
  "$dir_path/private/sync-archive.conf" | head -n1)" || exit 1

# destination = <absolute path>
destination_path="$(sed -ne 's/^destination *= *\(.\)/\1/p' \
  "$dir_path/private/sync-archive.conf" | head -n1)" || exit 1

# files ignored by git are skipped
# archive = <path in source>;<path in destination>;<nest inside directory>
archived_files_config="$(sed -ne 's/^archive *= *\(.\)/\1/p' \
  "$dir_path/private/sync-archive.conf")" || exit 1

# copy = <path in source>;<path in destination>
copied_files_config="$(sed -ne 's/^copy *= *\(.\)/\1/p' \
  "$dir_path/private/sync-archive.conf")" || exit 1

# anki = <path in destination>
anki_path_in_destination="$(sed -ne 's/^anki *= *\(.\)/\1/p' \
  "$dir_path/private/sync-archive.conf" | head -n1)" || exit 1

if [[ ! -d "$destination_path/vault/.git" ]]; then echo $'archive is not mounted'; exit 1; fi

mkdir -p "$temp_path" || exit 1
rm -rf "${temp_path:?}"/* 2> /dev/null

cleanup_and_panic() { rm -rf "$temp_path" 2> /dev/null; IFS="$initial_ifs"; exit 1; }
prepend() { while read -r line; do echo "$1$line"; done; }

initial_ifs="$IFS"
IFS=$'\n'

# ----------------------------- Require archiving -----------------------------

echo $'archiving files into temporary location\n'

mkdir -p "$temp_path/.temp" || cleanup_and_panic
for config_item in $archived_files_config; do
  if [[ -z "$config_item" ]]; then continue; fi
  item_path_in_source="$(printf '%s' "$config_item" | cut -d';' -f1)" || cleanup_and_panic
  item_path_in_destination="$(printf '%s' "$config_item" | cut -d';' -f2)" || cleanup_and_panic
  item_nest_inside_dir="$(printf '%s' "$config_item" | cut -d';' -f3)" || cleanup_and_panic

  if [[ -d "$source_path/$item_path_in_source/.git" ]]; then
    excluded_files="$(git -C "$source_path/$item_path_in_source" \
      ls-files --exclude-standard --others --directory --no-empty-directory --ignored)" \
      || cleanup_and_panic
    if [[ -n "$item_nest_inside_dir" ]]; then
      excluded_files="$(printf '%s' "$excluded_files" | prepend "$item_nest_inside_dir/")"
    fi
    else excluded_files=''
  fi

  printf '%s' "${excluded_files//,/$'\n'}" > "$temp_path/.temp/excluded_files" || cleanup_and_panic
  if [[ -n "$item_nest_inside_dir" ]]; then
    ln -s "$source_path/$item_path_in_source" "$temp_path/.temp/$item_nest_inside_dir" || cleanup_and_panic
    arcive_from_path="$temp_path/.temp/$item_nest_inside_dir"
  else
    arcive_from_path="$source_path/$item_path_in_source/*"
  fi

  7z a "$temp_path/$item_path_in_destination" "$arcive_from_path" \
    -x@"$temp_path/.temp/excluded_files" \
    || cleanup_and_panic
done
rm -rf "$temp_path/.temp" 2> /dev/null

gtk-launch org.gnome.Nautilus "$temp_path"
sleep 1
echo $'\n'"these files will be moved to $destination_path"
read -rp 'Is everything correct? [y/N]: ' ok || cleanup_and_panic
case "$ok" in
  y|Y)
    echo
    rsync -avcP "$temp_path/" "$destination_path/" || cleanup_and_panic
    echo $'\nfiles moved to the archive';;
  *) cleanup_and_panic;;
esac
rm -rf "$temp_path"

# ------------------------------- Sync directly -------------------------------

echo $'\nsyncing files that don\'t require archiving'

# Music

for config_item in $copied_files_config; do
  item_path_in_source="$(printf '%s' "$config_item" | cut -d';' -f1)" || cleanup_and_panic
  item_path_in_destination="$(printf '%s' "$config_item" | cut -d';' -f2)" || cleanup_and_panic

  echo $'\n'"synching '$source_path/$item_path_in_source' to '$destination_path/$item_path_in_destination'"
  read -rp 'is everything correct? [y/N]: ' ok || cleanup_and_panic
  case "$ok" in y|Y);; *) cleanup_and_panic;; esac

  read -rp $'\nsanitize files for exFAT first? (will rename the original files) [y/N]: ' ok || cleanup_and_panic
  case "$ok" in y|Y) "$dir_path/sanitize-exfat.sh" "$source_path/$item_path_in_source" || cleanup_and_panic;; esac

  echo
  rsync -avcP --delete "$source_path/$item_path_in_source/" "$destination_path/$item_path_in_destination/" || cleanup_and_panic
done

# ------------------------------ Anki collection ------------------------------

echo $'\nbacking up anki collection to file '"'$destination_path/$anki_path_in_destination'"
read -rp 'is everything correct? [y/N]: ' ok || cleanup_and_panic
case "$ok" in y|Y);; *) cleanup_and_panic;; esac

echo
"$dir_path/export-anki-collection.py" "$destination_path/$anki_path_in_destination" || cleanup_and_panic

# ------------------------------ Commit changes -------------------------------

echo $'\ncommitting changes to the vault\n'
git -C "$destination_path/vault" add . || cleanup_and_panic
git -C "$destination_path/vault" commit -m 'sync vault'

IFS="$initial_ifs"
