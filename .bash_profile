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

# Newt TUI
# Valid colors: black, blue, green, cyan, red, magenta, brown, lightgray, gray,
# brightblue, brightgreen, brightcyan, brightred, brightmagenta, yellow, white
export NEWT_COLORS='root=green,black border=green,black window=green,black '\
'shadow=green,black title=green,black button=green,black actbutton=black,green '\
'compactbutton=gray,black checkbox=green,black actcheckbox=black,green '\
'entry=green,black disentry=gray,black label=green,black listbox=green,black '\
'actlistbox=white,black sellistbox=black,green actsellistbox=black,green '\
'textbox=green,black acttextbox=black,green emptyscale=green,black '\
'fullscale=green,black helpline=green,black roottext=green,black'

# shellcheck source=/dev/null
. ~/.bashrc
