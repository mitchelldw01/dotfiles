autoload -Uz vcs_info
precmd_functions+=(vcs_info)

zstyle ':vcs_info:git:*' formats '%b'
zstyle ':vcs_info:*' enable git

color_host='%F{#5F7E97}'
color_dir='%F{#D18FF0}'
color_git='%F{#82AAFF}'
color_branch='%F{#BDE567}'

function update_vcs_info {
  vcs_info
  if [[ -n ${vcs_info_msg_0_} ]]; then
    MY_VCS_INFO="${color_git}git:(%B${color_branch}${vcs_info_msg_0_}%b${color_git}) "
  else
    MY_VCS_INFO=""
  fi
}

precmd_functions+=(update_vcs_info)

PROMPT='%{$reset_color%}${color_dir}%2~ ${MY_VCS_INFO}${color_host}▶ %f'
