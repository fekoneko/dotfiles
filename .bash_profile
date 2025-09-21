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

# Only NPM packages are global for all users (/usr/lib)

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

# shellcheck source=/dev/null
. ~/.bashrc
