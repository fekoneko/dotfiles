#!/usr/bin/env bash

# ------------------------------- Configuration -------------------------------

dir_path="$(dirname "$(realpath "$0")")"
config_path="$dir_path/sync-archive.conf"
temp_path="$HOME/.cache/sync-archive"

# source = <absolute path>
source_path="$(sed -ne 's/^source *= *\(.\)/\1/p' \
  "$config_path" | head -n1)" || exit 1

# destination = <absolute path>
destination_path="$(sed -ne 's/^destination *= *\(.\)/\1/p' \
  "$config_path" | head -n1)" || exit 1

# files ignored by git are skipped
# archive = <path in source>;<path in destination>[;<nest inside directory>]
archived_files_config="$(sed -ne 's/^archive *= *\(.\)/\1/p' \
  "$config_path")" || exit 1

# copy = <path in source>;<path in destination>
copied_files_config="$(sed -ne 's/^copy *= *\(.\)/\1/p' \
  "$config_path")" || exit 1

# anki = <path in destination>
anki_path_in_destination="$(sed -ne 's/^anki *= *\(.\)/\1/p' \
  "$config_path" | head -n1)" || exit 1

if [[ ! -d "$destination_path/vault/.git" ]]; then echo $'archive is not mounted'; exit 1; fi

mkdir -p "$temp_path" || exit 1
rm -rf "${temp_path:?}"/* 2> /dev/null

cleanup_and_panic() { rm -rf "$temp_path" 2> /dev/null; exit 1; }
prepend() { while read -r line; do echo "$1$line"; done; }

trap cleanup_and_panic EXIT
IFS=$'\n'

# ----------------------------- Require archiving -----------------------------

echo $'archiving files into temporary location\n'

for config_item in $archived_files_config; do
  if [[ -z "$config_item" ]]; then continue; fi
  item_path_in_source="$(printf '%s' "$config_item" | cut -d';' -f1)" || cleanup_and_panic
  item_path_in_destination="$(printf '%s' "$config_item" | cut -d';' -f2)" || cleanup_and_panic

  cd "$source_path/$item_path_in_source" || cleanup_and_panic

  if [[ -d '.git' ]]; then
    mapfile -d '' arcive_from_paths < <(git ls-files -z) || cleanup_and_panic
  else
    arcive_from_paths=("$source_path/$item_path_in_source/*")
  fi

  7z a "$temp_path/$item_path_in_destination" "${arcive_from_paths[@]}" || cleanup_and_panic
done

gtk-launch org.gnome.Nautilus "$temp_path" &> /dev/null
sleep 1
echo $'\n'"these files will be moved to $destination_path"
read -rp 'Is everything correct? [Y/n]: ' ok || cleanup_and_panic
case "$ok" in
  y|Y|'')
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
  read -rp 'is everything correct? [Y/n]: ' ok || cleanup_and_panic
  case "$ok" in y|Y|'');; *) cleanup_and_panic;; esac

  read -rp $'\nsanitize files for exFAT first? (will rename the original files) [Y/n]: ' ok || cleanup_and_panic
  case "$ok" in y|Y|'') "$dir_path/sanitize-exfat.sh" "$source_path/$item_path_in_source" || cleanup_and_panic;; esac

  echo
  rsync -avcP --delete "$source_path/$item_path_in_source/" "$destination_path/$item_path_in_destination/" \
    || cleanup_and_panic
done

# ------------------------------ Anki collection ------------------------------

echo $'\nbacking up anki collection to file '"'$destination_path/$anki_path_in_destination'"
read -rp 'is everything correct? [Y/n]: ' ok || cleanup_and_panic
case "$ok" in y|Y|'');; *) cleanup_and_panic;; esac

echo
"$dir_path/export-anki-collection.py" "$destination_path/$anki_path_in_destination" || cleanup_and_panic

# ---------------------------------- Done! ------------------------------------

echo
echo '--------------------------------------'
echo 'Syncing archive finished successfully!'
echo '--------------------------------------'
