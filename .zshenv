#
# Exporting variables
#

export EDITOR="nvim"
export KUBE_EDITOR=$EDITOR
export TERM="xterm-256color"
export PATH="$PATH:$HOME/.local/bin:$HOME/.scripts"
BLK="04" CHR="04" DIR="04" EXE="00" REG="00" HARDLINK="00" SYMLINK="06" MISSING="00" ORPHAN="01" FIFO="0F" SOCK="0F" OTHER="02"
export NNN_BMS="d:~/Documents;D:~/Downloads;"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"
export NNN_PLUG="p:preview-tui;v:imgview"
export NNN_FIFO="/tmp/nnn.fifo"
export NNN_TRASH=1
export CODE_DIR="~/Code"

if [ -e ~/.cargo/env ]; then
    . "$HOME/.cargo/env"
fi
