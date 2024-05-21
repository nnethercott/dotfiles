# autosuggestions 
set -g fish_autosuggestion_enabled 0

# add pyenv to path 
set PYENV_ROOT $HOME/.pyenv
set -x PATH $PYENV_ROOT/shims $PYENV_ROOT/bin $PATH

# need this on mac to make brew accessible in fish
# https://github.com/orgs/Homebrew/discussions/4412
eval "$(/usr/local/bin/brew shellenv)"

export $(cat ~/.config/.env | xargs)
