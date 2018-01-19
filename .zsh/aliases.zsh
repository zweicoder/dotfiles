# You can put files here to add functionality separated per file, which
# will be ignored by git.
# Files on the custom/ directory will be automatically loaded by the init
# script, in alphabetical order.

# For example: add yourself some shortcuts to projects you often work on.
#
# brainstormr=~/Projects/development/planetargon/brainstormr
# cd $brainstormr
#

# ag - the silver searcher
# Update ag to respect global ~/.ignore file
alias ag='ag --path-to-ignore ~/.ignore'

# Convenience functions
c () { cd "$1" && ls; }
activate(){ . "$1/bin/activate";}
open(){ xdg-open "$1"; }

# FASD
alias v='f -e vim'
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias j='fasd_cd -d'
alias ji='fasd_cd -d -i'

# Misc.
alias gds='git diff --staged'
alias gs='git status'
alias pls='sudo'
alias em='emacs -nw'
alias sm='emacs &'
alias dc='docker-compose'
alias ll='ls -lAh'

