# Handy way to cd and ls
g(){ cd "$1" && ls; }

function __cheat() {                
if [ $# == 1 ]; then                
    cheat $1 | cli-md
else                                
    cheat $@                        
fi                                  
}
alias cheat=__cheat

# Activate virtual env
activate(){ . "$1/bin/activate";}
open(){ gnome-open "$1"; }

export NVM_DIR="/home/pewpew/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

alias o='a -e xdg-open' # quick opening files with xdg-open
alias v='f -e vim' # quick opening files with vim
alias j='fasd_cd -d'     # cd, same functionality as j in autojump
alias ji='fasd_cd -d -i' # cd with interactive selection
eval "$(fasd --init auto)"
alias gs='git status'


