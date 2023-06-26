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
# zstyle ':completion:*' list-colors ''
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)*==34=34}:${(s.:.)LS_COLORS}")';
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

# use delete key to delete character after cursor
bindkey "^[[3~" delete-char
# activate vim bindings
bindkey -v
# use backspace key to delete character before cursor in vim mode
bindkey -v '^?' backward-delete-char
# incremental backward search
bindkey "^R" history-incremental-search-backward
export KEYTIMEOUT=1

# Command completion with prefix
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

#
# Aliases / Functions
#

# Load aliases from ~/.aliases file if present
if [ -e ~/.aliases ]; then
    . ~/.aliases
fi

# # Load functions from ~/.functions file if present
# if [ -e ~/.functions ]; then
#     . ~/.functions
# fi

# Manage dotfiles
function dotfiles() {
    /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}

#
# Initialize Starship Prompt
#

# eval "$(starship init zsh)"

# To remove the following ZSH plugins, remove the directory and
# remove the reference of the plugin below
# source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
#
# source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#
# Pyenv config
#

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

#
# Source an env.sh file
#

# autoload -U add-zsh-hook

# Define the function to source env.sh file
# source_env_file() {
#     local env_file="env.sh"
#
#     # Loop through each parent directory
#     local current_dir=$PWD
#     while [[ $current_dir != / ]]; do
#         # Check if the env.sh file exists and is readable in the current directory
#         if [[ -f "$current_dir/$env_file" && -r "$current_dir/$env_file" ]]; then
#             source "$current_dir/$env_file"
#             break
#         fi
#
#         # Move to the parent directory
#         current_dir=$(dirname "$current_dir")
#     done
# }

# Hook the function to the chpwd event
# add-zsh-hook chpwd source_env_file
