export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="custom"

zstyle ':omz:alpha:lib:git' async-prompt no
source $ZSH/oh-my-zsh.sh

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

export PATH=$PATH:$HOME/bin

export PATH=$PATH:$HOME/src/infrastructure/bin

export PATH=$PATH:$HOME/src/dev-tools/bin

[ -s "/Users/mitchell/.bun/_bun" ] && source "/Users/mitchell/.bun/_bun"

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export PNPM_HOME="/Users/mitchell/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

. "$HOME/.cargo/env"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias cd="z"
alias ct="cargo test"
alias gt="go test -v ./..."
alias vim=nvim
alias zb="zig build"
alias zbr="zig build run"
alias zbt="zig build test --summary all"

eval "$(rbenv init - zsh)"
eval "$(zoxide init zsh)"
