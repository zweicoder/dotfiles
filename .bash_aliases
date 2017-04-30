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

alias o='a -e xdg-open' # quick opening files with xdg-open

alias j='z'
alias gs='git status'
alias gds='git diff --staged'
alias gd='git diff'
alias glm='ls -ltd $(git status --porcelain | grep "^.[?M]" | sed "s/^.. //")'
alias docker_clean_images='docker rmi -f $(docker images -a --filter=dangling=true -q)'
alias docker_clean_containers='docker rm -v $(docker ps -a -q -f status=exited)'
alias docker_clean_volumes='docker volume rm $(docker volume ls -qf dangling=true)'

function docker_clean_all() {
    docker_clean_containers
    docker_clean_images
    docker_clean_volumes
}

alias x='pet exec'
alias prettify='prettier --single-quote --bracket-spacing true --trailing-comma es5 --write'
alias em='emacs -nw'
alias sm='emacs &'
