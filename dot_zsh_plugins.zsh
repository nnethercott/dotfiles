fpath+=( "$HOME/Library/Caches/antidote/github.com/zsh-users/zsh-completions/src" )
fpath+=( "$HOME/Library/Caches/antidote/github.com/belak/zsh-utils/editor" )
source "$HOME/Library/Caches/antidote/github.com/belak/zsh-utils/editor/editor.plugin.zsh"
fpath+=( "$HOME/Library/Caches/antidote/github.com/belak/zsh-utils/history" )
source "$HOME/Library/Caches/antidote/github.com/belak/zsh-utils/history/history.plugin.zsh"
fpath+=( "$HOME/Library/Caches/antidote/github.com/belak/zsh-utils/prompt" )
source "$HOME/Library/Caches/antidote/github.com/belak/zsh-utils/prompt/prompt.plugin.zsh"
fpath+=( "$HOME/Library/Caches/antidote/github.com/belak/zsh-utils/utility" )
source "$HOME/Library/Caches/antidote/github.com/belak/zsh-utils/utility/utility.plugin.zsh"
if ! (( $+functions[zsh-defer] )); then
  fpath+=( "$HOME/Library/Caches/antidote/github.com/romkatv/zsh-defer" )
  source "$HOME/Library/Caches/antidote/github.com/romkatv/zsh-defer/zsh-defer.plugin.zsh"
fi
fpath+=( "$HOME/Library/Caches/antidote/github.com/zdharma-continuum/fast-syntax-highlighting" )
zsh-defer source "$HOME/Library/Caches/antidote/github.com/zdharma-continuum/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
fpath+=( "$HOME/Library/Caches/antidote/github.com/jonmosco/kube-ps1" )
source "$HOME/Library/Caches/antidote/github.com/jonmosco/kube-ps1/kube-ps1.sh"
fpath+=( "$HOME/Library/Caches/antidote/github.com/romkatv/powerlevel10k" )
source "$HOME/Library/Caches/antidote/github.com/romkatv/powerlevel10k/powerlevel10k.zsh-theme"
fpath+=( "$HOME/Library/Caches/antidote/github.com/so-fancy/diff-so-fancy" )
source "$HOME/Library/Caches/antidote/github.com/so-fancy/diff-so-fancy/diff-so-fancy.plugin.zsh"
