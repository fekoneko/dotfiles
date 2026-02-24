#!/usr/bin/env bash

# Usage: log_command <message> <command>
log_command() { echo $'\n'"$1:"$'\n'"$ $2"; }

paru_error() {
  command='sudo pacman -Sy --needed archlinux-keyring && pacman -Su'
  log_command 'Failed to update packages, try updating the keyring first' "$command" >&2
  command='sudo npm --global remove node-gyp'
  log_command 'In case of /usr/lib/node_modules conflict, try removing the corresponding npm package' "$command" >&2
  exit 1
}

timeshift_error()      { echo $'\nFailed to create timeshift snapshot'      >&2; exit 1; }
flatpak_error()        { echo $'\nFailed to update flatpak packages'        >&2; exit 1; }
flatpak_unused_error() { echo $'\nFailed to remove unused flatpak packages' >&2; exit 1; }
npm_error()            { echo $'\nFailed to update npm packages'            >&2; exit 1; }
pnpm_error()           { echo $'\nFailed to update pnpm packages'           >&2; exit 1; }
yarn_error()           { echo $'\nFailed to update yarn packages'           >&2; exit 1; }
bun_error()            { echo $'\nFailed to update bun packages'            >&2; exit 1; }
go_error()             { echo $'\nFailed to update go binaries'             >&2; exit 1; }
rust_error()           { echo $'\nFailed to update rust'                    >&2; exit 1; }
cargo_error()          { echo $'\nFailed to update cargo binaries'          >&2; exit 1; }

echo '-----------------------'
echo 'Starting system upgrade'
echo '-----------------------'
echo

read -rep 'Create timeshift snapshot? [Y/n] ' choice
case "$choice" in y|Y|'')
  command="sudo timeshift --create --comments 'before upgrade'"
  log_command 'Creating timeshift snapshot' "$command"
  eval "$command" || timeshift_error
esac

echo $'\nPlease check the news, could anything break?'
nohup zen-browser --new-tab https://archlinux.org/news/ &> /dev/null
read -rep 'Proceed? [Y/n] ' choice
case "$choice" in y|Y|'') ;; *) exit 1;; esac

command='paru -Syu --disable-download-timeout'
log_command 'Updating system packages' "$command"
eval "$command" || paru_error

command='flatpak update'
log_command 'Updating flatpak packages' "$command"
eval "$command" || flatpak_error

command='flatpak remove --unused'
log_command 'Removing unused flatpak packages' "$command"
eval "$command" || flatpak_unused_error

command='sudo npm update -g'
log_command 'Updating npm packages' "$command"
eval "$command" || npm_error

command='pnpm update -g'
log_command 'Updating pnpm packages' "$command"
eval "$command" || pnpm_error

command='yarn global upgrade'
log_command 'Updating yarn packages' "$command"
eval "$command" || yarn_error

command='bun update -g'
log_command 'Updating bun packages' "$command"
eval "$command" || bun_error

command='gup update'
log_command 'Updating go binaries' "$command"
eval "$command" || go_error

command='rustup self upgrade-data && rustup update'
log_command 'Updating rust' "$command"
eval "$command" || rust_error

cargo_packages="$(jq -r '.installs | keys[] | split(" ")[0]' \
  < "$CARGO_HOME/.crates2.json")" || cargo_error

if [[ -n "$cargo_packages" ]]; then
  command="cargo install --locked ${cargo_packages/$'\n'/' '}"
  log_command 'Updating cargo binaries' "$command"
  eval "$command" || cargo_error
else
  echo $'\nNo cargo binaries to update'
fi

echo
echo '-------------------------------------'
echo 'System upgrade finished successfully!'
echo '-------------------------------------'
