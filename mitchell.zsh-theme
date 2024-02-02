autoload -Uz vcs_info
precmd_functions+=(vcs_info)

zstyle ':vcs_info:*' formats '(%b)'
zstyle ':vcs_info:*' enable git

color_git='%F{#FFB757}'

PROMPT='%F{#91CBFF}%m%f :: %2~'
PROMPT+='${vcs_info_msg_0_:+ "%{$color_git%}%B${vcs_info_msg_0_}%b"}'
PROMPT+=' %{$reset_color%}$ '
