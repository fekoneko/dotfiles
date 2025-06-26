#!/usr/bin/env bash

# TODO: sync pixiv bookmarks / works

# ------------------------------- Configuration -------------------------------

dir_path="$(dirname "$(realpath "$0")")"
temp_path="$HOME/.cache/sync-archive"
archive_path="$HOME/Archive"

# <home path>;<archive path>;<nest inside directory>
archived_files_config="$(cat "$dir_path/private/archived_files.conf")" || exit 1

# <home path>;<archive path>
copied_files_config="$(cat "$dir_path/private/copied_files.conf")" || exit 1

if [[ ! -d "$archive_path/vault/.git" ]]; then echo $'archive is not mounted'; exit 1; fi

# ----------------------------- Require archiving -----------------------------

mkdir -p "$temp_path" || exit 1
rm -rf "${temp_path:?}"/* 2> /dev/null
cleanup_and_panic() { rm -rf "$temp_path" 2> /dev/null; IFS="$initial_ifs"; exit 1; }
prepend() { while read -r line; do echo "$1$line"; done; }

initial_ifs="$IFS"
IFS=$'\n'

echo $'archiving files into temporary location\n'

mkdir -p "$temp_path/.temp" || cleanup_and_panic
for config_item in $archived_files_config; do
  if [[ -z "$config_item" ]]; then continue; fi
  item_home_path="$(printf '%s' "$config_item" | cut -d';' -f1)" || cleanup_and_panic
  item_archive_path="$(printf '%s' "$config_item" | cut -d';' -f2)" || cleanup_and_panic
  item_nest_inside_dir="$(printf '%s' "$config_item" | cut -d';' -f3)" || cleanup_and_panic

  if [[ -d "$HOME/$item_home_path/.git" ]]; then
    excluded_files="$(git -C "$HOME/$item_home_path" \
      ls-files --exclude-standard --others --directory --no-empty-directory --ignored)" \
      || cleanup_and_panic
    if [[ -n "$item_nest_inside_dir" ]]; then
      excluded_files="$(printf '%s' "$excluded_files" | prepend "$item_nest_inside_dir/")"
    fi
    else
      excluded_files=''
  fi

  printf '%s' "${excluded_files//,/$'\n'}" > "$temp_path/.temp/excluded_files" || cleanup_and_panic
  if [[ -n "$item_nest_inside_dir" ]]; then
    ln -s "$HOME/$item_home_path" "$temp_path/.temp/$item_nest_inside_dir" || cleanup_and_panic
    source_path="$temp_path/.temp/$item_nest_inside_dir"
  else
    source_path="$HOME/$item_home_path/*"
  fi

   7z a "$temp_path/$item_archive_path" "$source_path" \
    -x@"$temp_path/.temp/excluded_files" \
    || cleanup_and_panic
done
rm -rf "$temp_path/.temp" 2> /dev/null

gtk-launch org.gnome.Nautilus "$temp_path"
sleep 1
echo $'\n'"these files will be moved to $archive_path"
read -rp 'Is everything correct? [y/N]: ' ok || cleanup_and_panic
case "$ok" in
  y|Y)
    echo
    rsync -avcP "$temp_path/" "$archive_path/" || cleanup_and_panic
    git -C "$archive_path/vault" add . || cleanup_and_panic
    git -C "$archive_path/vault" commit -m 'sync vault'
    echo $'\nfiles moved to the archive';;
  *) cleanup_and_panic;;
esac
rm -rf "$temp_path"

# ------------------------------- Sync directly -------------------------------

echo $'\nsyncing files that don\'t require archiving\n'

# Music

for config_item in $copied_files_config; do
  item_home_path="$(printf '%s' "$config_item" | cut -d';' -f1)" || cleanup_and_panic
  item_archive_path="$(printf '%s' "$config_item" | cut -d';' -f2)" || cleanup_and_panic

  echo "synching '$HOME/$item_home_path' to '$archive_path/$item_archive_path'"
  read -rp 'is everything correct? [y/N]: ' ok || cleanup_and_panic
  case "$ok" in y|Y);; *) cleanup_and_panic;; esac

  read -rp $'\nsanitize files for exFAT first? (will rename the original files) [y/N]: ' ok || cleanup_and_panic
  case "$ok" in y|Y) "$dir_path/sanitize-exfat.sh" "$HOME/$item_home_path" || cleanup_and_panic;; esac

  echo
  rsync -avcP --delete "$HOME/$item_home_path/" "$archive_path/$item_archive_path/" || cleanup_and_panic
done

IFS="$initial_ifs"
