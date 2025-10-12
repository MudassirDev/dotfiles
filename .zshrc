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
alias clean="yay -Scc"

alias GO="cd ~/Programming/Go"
alias JS="cd ~/Programming/JS"
alias PYTHON="cd ~/Programming/Python"
alias notes="cd ~/Programming/notes/ && nvim"

alias editor="cd ~/.config/nvim/"
alias fastfetch="fastfetch --logo ~/.config/pictures/Rimuru-PNG-Picture.png"
alias scroll-fix='xinput set-prop "MSHW0092:00 045E:0933 Touchpad" "libinput Natural Scrolling Enabled" 1' # fix natural scrolling

export PATH=$PATH:~/go/bin
