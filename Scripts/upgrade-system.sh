#!/usr/bin/env bash

paru_error() {
  echo $'\nFailed to upgrade packages, try upgrading the keyring first:'
  echo '$ sudo pacman -Sy --needed archlinux-keyring && pacman -Su'
  exit 1
}

flatpak_error() {
  echo $'\nFailed to upgrade flatpack packages'
  exit 1
}

echo $'Upgrading system packages:\n$ paru -Syu\n'
paru -Syu || paru_error

echo $'\nUpgrading flatpack packages:\n$ flatpak update\n'
flatpak update || flatpak_error
