# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="mitchell"

source $ZSH/oh-my-zsh.sh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# bin 
export PATH=$PATH:$HOME/bin

# dev-tools 
export PATH=$PATH:$HOME/src/dev-tools/bin

# bun
[ -s "/Users/mitchell/.bun/_bun" ] && source "/Users/mitchell/.bun/_bun"

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# cargo
. "$HOME/.cargo/env"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# aliases
alias vim=nvim
alias fucking=sudo

