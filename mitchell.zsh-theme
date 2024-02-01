autoload -Uz vcs_info
precmd_functions+=(vcs_info)

zstyle ':vcs_info:*' formats '(%b)'
zstyle ':vcs_info:*' enable git

PROMPT='%m :: %2~ %{$fg_bold[green]%}%B${vcs_info_msg_0_}%b %{$reset_color%}» '
