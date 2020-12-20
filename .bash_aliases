# Python aliases
alias vc='virtualenv venv'
alias va='source ./venv/bin/activate'
alias vd='deactivate'

# Interactive command aliases
alias mv='mv -in'
alias cp='cp -in'
alias rm='rm -i'

# Ignore snaps
alias lsblk='lsblk -af |grep -sv loop'

# Manage dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dotgraph='dotfiles log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'

# Get coloured output
alias diff="diff --color=auto"
