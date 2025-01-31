# Oh-my-zsh config
export ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME="robbyrussell"
ZSH_THEME="natenethercott"
plugins=(zsh-syntax-highlighting)

# add additional completions
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
source $ZSH/oh-my-zsh.sh


# autoload -Uz compinit && compinit
# # zinit config
# # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# # Initialization code that may require console input (password prompts, [y/n]
# # confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
# [ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
# [ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
# source "${ZINIT_HOME}/zinit.zsh"

# zinit light zdharma-continuum/fast-syntax-highlighting
# zinit light zsh-users/zsh-completions
# zinit light romkatv/powerlevel10k

# fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
# fpath=(~/.zfunc/ $fpath)
# rm -f ~/.zcompdump; compinit
# autoload -U compinit && compinit -u -C

# # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# persists command history across windows
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVE_HIST=$HISTFILE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space

# https://www.reddit.com/r/linux4noobs/comments/tkvs8o/kitty_terminal_with_ssh_issues/
# export TERM=xterm-256color

# binaries
export PATH="$PATH:$HOME/.local/bin"

# k8s stuff
alias k='kubectl'
complete -F __start_kubectl k
alias kx='kubectx'
alias kn='kubens'
complete -F _complete_alias kx
complete -F _complete_alias kn

source <(kubectl completion zsh)
source <(argo completion zsh)
source <(minikube completion zsh)
source <(k3d completion zsh)


# cargo
export PATH="$HOME/.cargo/bin:$PATH"
alias rgf='rg --files | rg'

# go
export PATH=$PATH:/usr/local/go/bin

# uv
# eval "$(uv generate-shell-completion zsh)"

# libtorch
export LIBTORCH=~/libtorch
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/libtorch/lib

# new ctags for vim tagbar
export PATH=/usr/local/bin/ctags:$PATH

# flutter
export PATH="/home/nnethercott/development/flutter/bin:$PATH"
export PATH="$PATH:/opt/android-studio/bin"
eval "$(flutter zsh-completion)"
export PATH="$PATH:$HOME/.pub-cache/bin"
export JAVA_HOME="/usr/lib/jvm/java-17-openjdk-amd64"

# pyenv old
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# fnm
FNM_PATH="/home/nnethercott/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/nnethercott/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi
source <(fnm completions --shell zsh)
eval "$(fnm env --use-on-cd --shell zsh)"
alias nvm="fnm"

# nvm old
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# FIXING VIM COLORS
export TERM=xterm-256color
