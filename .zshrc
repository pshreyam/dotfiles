# Custom Prompt
autoload -U colors && colors

# add %{%G<character>%} around non-ASCII characters
PROMPT="%B%F{171}%1~%f %{%G›%}%b "

setopt histignorealldups sharehistory

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

#Set RPROMPT with git branch name
setopt prompt_subst
. ~/.scripts/git-prompt.sh
export RPROMPT=$'$(__git_ps1 "%s")'

unsetopt prompt_cr prompt_sp
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
#setopt share_history         # share command history data

# force zsh to show the complete history
alias history="history 0"

# Use modern completion system
autoload -Uz compinit
compinit

# Some custom configs
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

new_line_before_prompt=yes
precmd() {
    # Print a new line before the prompt, but only if it is not the first line
    if [ "$new_line_before_prompt" = yes ]; then
	    if [ -z "$_NEW_LINE_BEFORE_PROMPT" ]; then
	        _NEW_LINE_BEFORE_PROMPT=1
	    else
	        print ""
	    fi
    fi
}

alias ll='ls -alF'
alias la='ls -A'

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

bindkey "^[[3~" delete-char

# Custom Config Starts

export EDITOR="/usr/bin/nvim"
export TERM="xterm-256color"
export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"
export LC_CTYPE="en_US.UTF-8"
export PATH="$PATH:/sbin"

export PATH="$PATH:/opt/flutter/bin"
export CHROME_EXECUTABLE="/usr/bin/brave-browser"

# Load aliases from ~/.aliases file if present
if [ -e ~/.aliases ]; then
    . ~/.aliases
fi
