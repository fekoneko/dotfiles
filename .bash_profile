# shellcheck shell=bash

# ~/.local/bin
export PATH="$HOME/.local/bin:$PATH"

# Go
export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:$PATH"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"
export CARGO_HOME="$HOME/.cargo"

# Bun
export PATH="$HOME/.bun/bin:$PATH"

# PNPM
export PNPM_HOME="$HOME/.pnpm"
export PATH="$HOME/.pnpm:$PATH"

# Android tools
export PATH="/opt/android-sdk/platform-tools:$PATH"

# Only NPM packages are global for all users (/usr/lib)

# Rootless Docker
export DOCKER_HOST="unix://$XDG_RUNTIME_DIR/docker.sock"

# Newt TUI
# Valid colors: black, blue, green, cyan, red, magenta, brown, lightgray, gray,
# brightblue, brightgreen, brightcyan, brightred, brightmagenta, yellow, white
export NEWT_COLORS='root=cyan,black border=cyan,black window=cyan,black '\
'shadow=cyan,black title=cyan,black button=cyan,black actbutton=black,cyan '\
'compactbutton=gray,black checkbox=cyan,black actcheckbox=black,cyan '\
'entry=cyan,black disentry=gray,black label=cyan,black listbox=cyan,black '\
'actlistbox=white,black sellistbox=black,cyan actsellistbox=black,cyan '\
'textbox=cyan,black acttextbox=black,cyan emptyscale=cyan,black '\
'fullscale=cyan,black helpline=cyan,black roottext=cyan,black'

# Eza (ls replacement) colors
export EZA_COLORS='oc=90:ur=92:uw=92:ux=92:ue=92:gr=93:gw=93:gx=93:tr=91:tw=91:'\
'tx=91:su=90:sf=90:xa=90:uu=92:uR=91:un=93:gu=92:gR=91:gn=93:da=90'

# Bat (cat replacement) style
export BAT_STYLE='changes,numbers,snip'

# shellcheck source=/dev/null
. ~/.bashrc
