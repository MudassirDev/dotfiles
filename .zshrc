export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell" # fallback theme
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
eval "$(starship init zsh)"
source /usr/share/nvm/init-nvm.sh

alias update="sudo pacman -Syu"
alias install="sudo pacman -S"
alias sync="sudo pacman -Syy"
alias reflector="reflector --latest 5 --sort rate --save /etc/pacman.d/mirrorlist"
alias remove="sudo pacman -Rns"

alias GO="cd ~/Programming/Go"
alias JS="cd ~/Programming/JS"
alias PYTHON="cd ~/Programming/Python"

alias editor="cd ~/.config/nvim/"
alias fastfetch="fastfetch --logo ~/.config/pictures/Rimuru-PNG-Picture.png"
fastfetch
