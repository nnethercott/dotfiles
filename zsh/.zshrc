if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# antitode
source $HOME/.antidote/antidote.zsh
zsh_plugins=$HOME/.zsh_plugins
# ZSH_THEME="natenethercott"
[[ -f ${zsh_plugins}.txt || -L ${zsh_plugins}.txt ]] || touch ${zsh_plugins}.txt

# zsh-autosuggest
# bindkey '^ ' autosuggest-accept

antidote load

# ZSH_THEME="natenethercott"

# extra completions
fpath+=$HOME/.zfunc
autoload -U +X compinit && compinit

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
export PATH="/home/nnethercott/development/flutter/bin:$PATH"  #flutter
export PATH="$PATH:/opt/android-studio/bin" #android studio
export PATH="$PATH:$HOME/.pub-cache/bin" # pub
export PATH="$PATH:/opt/nvim-linux64/bin"  #nvim

# k8s stuff
alias k='kubectl'
alias kx='kubectx'
alias kn='kubens'

# misc aliases
alias rgf='rg --files | rg'
alias ls="ls --color=auto"

# libtorch
# export LIBTORCH=~/libtorch
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/libtorch/lib

# flutter
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
alias nvm="fnm"

# deepomatic
source /home/nnethercott/.dmake/config.sh
export DEEPOMATIC_CONFIG_DIR="$HOME/deepomatic/env"
export KUBECONFIG=$HOME/.kube/config:$DEEPOMATIC_CONFIG_DIR/kubernetes/config

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh  ]] || source ~/.p10k.zsh
