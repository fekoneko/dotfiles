#!/usr/bin/env bash

timeshift_error() { echo $'\nFailed to create timeshift snapshot'; exit 1; }
paru_error() {
  echo $'\nFailed to update packages, try updating the keyring first:'
  echo '$ sudo pacman -Sy --needed archlinux-keyring && pacman -Su'
  echo 'In case of /usr/lib/node_modules conflict, try removing corresponding npm package, e.g.:'
  echo '$ npm --global remove node-gyp'
  exit 1
}
flatpak_error() { echo $'\nFailed to update flatpak packages'; exit 1; }
npm_error()     { echo $'\nFailed to update npm packages';     exit 1; }
pnpm_error()    { echo $'\nFailed to update pnpm packages';    exit 1; }
bun_error()     { echo $'\nFailed to update bun packages';     exit 1; }
go_error()      { echo $'\nFailed to update go binaries';      exit 1; }
rust_error()    { echo $'\nFailed to update rust';             exit 1; }
cargo_error()   { echo $'\nFailed to update cargo binaries';   exit 1; }

read -rp 'Create timeshift snapshot? [Y/n] ' choice
case "$choice" in
  y|Y|'' )
    echo $'Creating timeshift snapshot:\n$ sudo timeshift --create --comments \'before upgrade\'\n'
    sudo timeshift --create --comments 'before upgrade' || timeshift_error;;
  * ) ;;
esac

echo $'\nPlease check the news, can anything break?'
nohup zen-browser --new-tab https://archlinux.org/news/ > /dev/null 2>/dev/null &
read -rp 'Proceed? [Y/n] ' choice
case "$choice" in y|Y|'' ) ;; * ) exit 1;; esac

echo $'\nUpdating system packages:\n$ paru -Syu\n'
paru -Syu || paru_error

echo $'\nUpdating flatpack packages:\n$ flatpak update\n'
flatpak update || flatpak_error

echo $'\nUpdating npm packages:\n$ sudo npm update -g\n'
sudo npm update -g || npm_error

echo $'\nUpdating pnpm packages:\n$ pnpm update -g\n'
pnpm update -g || pnpm_error

echo $'\nUpdating bun packages:\n$ bun update -g\n'
bun update -g || bun_error

echo $'\nUpdating go binaries:\n$ gup update\n'
gup update || go_error

echo $'\nUpdating rust:\n$ rustup self upgrade-data\n$ rustup update\n'
rustup self upgrade-data || rust_error
rustup update || rust_error

echo $'\nUpdating cargo binaries:'
echo $'$ cargo_packages="$(jq -r \'.installs | keys[] | split(" ")[0]\' < "$CARGO_HOME/.crates2.json")"'
echo $'$ cargo install --locked "$cargo_packages"\n'
cargo_packages="$(jq -r '.installs | keys[] | split(" ")[0]' < "$CARGO_HOME/.crates2.json")" || cargo_error
cargo install --locked "$cargo_packages" || cargo_error

echo
echo '-------------------------------------'
echo 'System upgrade finished successfully!'
echo '-------------------------------------'
