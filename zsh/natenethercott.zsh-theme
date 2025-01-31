# 256 color ref: https://misc.flogisoft.com/bash/tip_colors_and_formatting
PROMPT_SYMBOL="❯"
# PROMPT="%(?:%{$fg_bold[green]%}%1{$PROMPT_SYMBOL%} :%{$fg_bold[red]%}%1{$PROMPT_SYMBOL%} ) %{$fg[cyan]%}%c%{$reset_color%}"
  # Prompt colors.

# kube_ps1 stuff
KUBE_PS1_PREFIX='['
KUBE_PS1_SUFFIX=']'
KUBE_PS1_CTX_COLOR='26'
KUBE_PS1_NS_COLOR='105'

PROMPT='$(kube_ps1) '
PROMPT+="%{$fg[cyan]%}%c%{$reset_color%}"
PROMPT+=' $(git_prompt_info)'
PROMPT+='%(?:%F{46}${PROMPT_SYMBOL}%f :%F{160}${PROMPT_SYMBOL}%f )% '
# PROMPT+='%(?:%{$fg_bold[green]%}${PROMPT_SYMBOL}%{$reset_color%} :%{$fg_bold[red]%}${PROMPT_SYMBOL}%{$reset_color%} )% '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(\ue725|%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[blue]%})"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}%{$fg[yellow]%}%1{*%}"
# ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
