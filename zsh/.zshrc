# https://stackoverflow.com/questions/66338988/complete13-command-not-found-compdef
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# extra completions
fpath+=$HOME/.zfunc
autoload -U +X compinit && compinit -C
autoload -Uz lg sc

# antitode
source $HOME/.antidote/antidote.zsh
zsh_plugins=$HOME/.zsh_plugins
[ -f ${zsh_plugins}.txt ] || touch ${zsh_plugins}.txt
antidote load

# https://www.reddit.com/r/linux4noobs/comments/tkvs8o/kitty_terminal_with_ssh_issues/
export TERM=xterm-256color

# history (persists across windows)
HISTSIZE=5000
HISTFILE=~/.local/share/zsh/history
SAVE_HIST=$HISTFILE
setopt hist_ignore_all_dups
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space

# editors
export EDITOR="nvim"
export KUBE_EDITOR="nvim"

# vi mode
set -o vi
KEYTIMEOUT=8
bindkey -M viins 'jk' vi-cmd-mode
bindkey -M viins '^R' history-incremental-search-backward
bindkey -M vicmd '^R' history-incremental-search-backward

# Aliases
# k8s
alias k='kubectl'
alias kx='kubectx'
alias kn='kubens'
# git
alias gs='git status --short'
alias ga='git add'
alias gd='git diff'
alias gc='git commit'
alias gco='git checkout'
alias gp='git pull'
alias gl='git log --graph --pretty=format:"%C(magenta)%h %C(yellow) %an  %C(cyan) %ar%C(blue)  %D%n%s%n"'
# misc
alias rgf='rg --files | rg'
alias ls="ls --color=auto"
alias cd="z"
alias cb="pbcopy"
# terraform
alias t="terraform"

# binaries
## fnm
eval "$(fnm env)"
alias nvm="fnm"
## zoxide
eval "$(zoxide init zsh)"
## carapace
source <(carapace _carapace)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh  ]] || source ~/.p10k.zsh
