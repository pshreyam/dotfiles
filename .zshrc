#
# History config
#

# Keep 10000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

#
# Set different zsh options
#

setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups # ignore duplicated commands history list
setopt hist_ignore_space # ignore commands that start with space
setopt hist_verify # show command with history expansion to user before running it
setopt share_history # share command history data
# setopt correct # correct command
setopt prompt_subst # allow command substitutions in prompt
unsetopt prompt_cr prompt_sp

# Load colours function and run it
autoload -U colors && colors

#
# Set custom prompt
#

# add %{%G<character>%} around non-ASCII characters
export PROMPT='%B%F{171}%1~%f %{%G›%}%b '

# Set git branch name in the zsh prompt
if [[ -f ~/.scripts/git-prompt.sh ]]; then
    . ~/.scripts/git-prompt.sh
    GIT_PS1_SHOWCOLORHINTS=1
    GIT_PS1_SHOWDIRTYSTATE=1
    # add %{%G<character>%} around non-ASCII characters
    export PROMPT='%B%F{171}%1~%f $(__git_ps1 "on %s")%{%G›%}%b '
fi

#
# Completion config
#

# Use modern completion system
autoload -Uz compinit
compinit
_comp_options+=(globdots) # include hidden files

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

#
# Custom keybindings
#

bindkey "^[[3~" delete-char # use delete key to delete character
bindkey -v # activate vim bindings
bindkey "^R" history-incremental-search-backward # incremental backward search
export KEYTIMEOUT=1

# Command completion with prefix
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Bind Up and Down arrow keys (defined in /etc/zsh/zshrc) to custom prefix completion function
bindkey "$key[Up]" up-line-or-beginning-search
bindkey "$key[Down]" down-line-or-beginning-search

#
# Exporting variables
#

export EDITOR="/usr/bin/nvim"
export TERM="xterm-256color"
export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"
export LC_CTYPE="en_US.UTF-8"
export PATH="$PATH:/sbin:/opt/flutter/bin:$HOME/.dotnet/tools:$HOME/Downloads/lua-5.4.4/src"
export CHROME_EXECUTABLE="/usr/bin/brave-browser"

#
# Aliases
#

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias history="history 0" # force zsh to show the complete history
alias ll='ls -alF'
alias la='ls -A'

# Load aliases from ~/.aliases file if present
if [ -e ~/.aliases ]; then
    . ~/.aliases
fi

#
# New line before each new prompt except the first one
#

new_line_before_prompt=yes
precmd() {
    if [ "$new_line_before_prompt" = yes ]; then
	    if [ -z "$_NEW_LINE_BEFORE_PROMPT" ]; then
	        _NEW_LINE_BEFORE_PROMPT=1
	    else
	        print ""
	    fi
    fi
}
