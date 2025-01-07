PROMPT_SYMBOL="❯"
# PROMPT="%(?:%{$fg_bold[green]%}%1{$PROMPT_SYMBOL%} :%{$fg_bold[red]%}%1{$PROMPT_SYMBOL%} ) %{$fg[cyan]%}%c%{$reset_color%}"
PROMPT="%{$fg[cyan]%}%c%{$reset_color%}"
PROMPT+=' $(git_prompt_info)'
PROMPT+='%(?:%{$fg_bold[green]%}${PROMPT_SYMBOL}%{$reset_color%} :%{$fg_bold[red]%}${PROMPT_SYMBOL}%{$reset_color%} )% '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%1{✗%}"
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%})"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
