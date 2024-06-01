export ZSH=/nix/store/syrk8d3zr59k80z5ni4zw545jjddj268-oh-my-zsh-2023-06-26/share/oh-my-zsh
source $ZSH/oh-my-zsh.sh
ZSH_THEME="robbyrussell"

source /nix/store/0kypshl9kbv6zhw0ap6q00aa51xmij59-zsh-syntax-highlighting-0.7.1/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /nix/store/w4akzj72nwx09cvrdhqj6a7akd79w0d8-zsh-autosuggestions-0.7.0/share/zsh-autosuggestions/zsh-autosuggestions.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(zoxide init zsh)"

alias vim=nvim
alias cd="z"
alias zb="zig build"
alias zbr="zig build run"
alias zbt="zig build test --summary all"
alias gt="go test -v ./..."

autoload -Uz compinit && compinit
