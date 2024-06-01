local reset_color='%f%k'
local host_color='%F{blue}'
local dir_color='%F{magenta}'
local git_color='%F{yellow}'
local branch_color='%F{white}'
local time_color='%F{white}'
local star_color='%F{red}'

PROMPT="${host_color}%m${reset_color}:${dir_color}%~${reset_color} "
PROMPT+='$(git_prompt_info)'
PROMPT+="${reset_color}
$ "

RPROMPT="${time_color}%*${reset_color}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$git_color%}git:(%{$branch_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$git_color%})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$branch_color%}%{$star_color%}*%{$branch_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$branch_color%})"
