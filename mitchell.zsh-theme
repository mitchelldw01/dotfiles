autoload -Uz vcs_info
precmd_functions+=(vcs_info)

zstyle ':vcs_info:*' formats '(%b)'
zstyle ':vcs_info:*' enable git

# Define colors
color_host='%F{#cba6f7}'
color_dir='%F{#89b4fa}'
color_branch='%F{#eba0ac}'

# Configure the prompt
PROMPT="${color_host}%m%f :: "
PROMPT+="${color_dir}%2~"
PROMPT+='${vcs_info_msg_0_:+ "%{'"${color_branch}"'%}%B${vcs_info_msg_0_}%b"}'
PROMPT+=' %{$reset_color%}$ '
