autoload -Uz vcs_info
precmd_functions+=(vcs_info)

zstyle ':vcs_info:*' formats '(%b)'
zstyle ':vcs_info:*' enable git

# Define colors
color_host='%F{#5F7E97}'
color_dir='%F{#82AAFF}'
color_branch='%F{#C5E478}'

# Configure the prompt
PROMPT="${color_host}%m%f :: "
PROMPT+="${color_dir}%2~"
PROMPT+='${vcs_info_msg_0_:+ "%{'"${color_branch}"'%}%B${vcs_info_msg_0_}%b"}'
PROMPT+=' %{$reset_color%}$ '
