# PATH exports
export PATH="$PATH:/opt/homebrew/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.opencode/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql@8.4/bin:$PATH"

# binaries
## fnm
FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
fi
## k9s
export K9S_CONFIG_DIR="${HOME}/.config/k9s"
## fzf: https://github.com/junegunn/fzf.vim/issues/453
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow'

