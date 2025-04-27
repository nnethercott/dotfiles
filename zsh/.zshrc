# https://stackoverflow.com/questions/66338988/complete13-command-not-found-compdef
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# extra completions
fpath+=$HOME/.zfunc
autoload -U +X compinit && compinit -C

# antitode
source $HOME/.antidote/antidote.zsh
zsh_plugins=$HOME/.zsh_plugins
[ -f ${zsh_plugins}.txt ] || touch ${zsh_plugins}.txt
antidote load

# history (persists across windows)
HISTSIZE=5000
HISTFILE=~/.local/share/zsh/history
SAVE_HIST=$HISTFILE
setopt hist_ignore_all_dups
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space

# https://www.reddit.com/r/linux4noobs/comments/tkvs8o/kitty_terminal_with_ssh_issues/
export TERM=xterm-256color

# binaries
export PATH="$PATH:$HOME/.local/bin"
export PATH="$HOME/.cargo/bin:$PATH"  #cargo
export PATH=$PATH:/usr/local/go/bin #go
export PATH=$PATH:$HOME/go/bin
export PATH="/home/nnethercott/development/flutter/bin:$PATH"  #flutter
export PATH="$PATH:/opt/android-studio/bin" #android studio
export PATH="$PATH:$HOME/.pub-cache/bin" #pub
export PATH="$PATH:/opt/nvim-linux64/bin"  #nvim

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
alias gp='git pull'
alias gl='git log --graph --all --pretty=format:"%C(magenta)%h %C(yellow) %an  %C(cyan) %ar%C(blue)  %D%n%s%n"'
# misc 
alias rgf='rg --files | rg'
alias ls="ls --color=auto"
alias cursor='~/Applications/cursor.AppImage --no-sandbox'
alias obsidian='~/Applications/obsidian.AppImage'

# pyenv (not sure if i actually need this)
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - --no-rehash zsh)"

# fzf
export FZF_DEFAULT_OPTS='--bind=tab:down,shift-tab:up'

# # fnm
FNM_PATH="/home/nnethercott/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/nnethercott/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi
alias nvm="fnm"

# # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh  ]] || source ~/.p10k.zsh
