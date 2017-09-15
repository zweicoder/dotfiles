# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=~/bin:$PATH
export GOPATH=~/go:/media/code/go-projects
GOPATHBINS=~/go/bin:/media/code/go-projects/bin
export PATH=$PATH:$GOPATHBINS
export PATH=$PATH:~/idea-IU/bin
export PATH="$HOME/.local/bin:$PATH"
export VISUAL=vim
export EDITOR="$VISUAL"
export LANG=en_US.UTF-8

# Path to your oh-my-zsh installation.
  export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
HISTSIZE=500000
HISTFILESIZE=100000
HISTORY_IGNORE="(ls|pwd|exit|bg|fg|history|clear)"
ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_CUSTOM="$HOME/.zsh/"


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(git gitfast git-extras colored-man-pages command-not-found copydir cp dircycle fasd tmuxinator)

source $ZSH/oh-my-zsh.sh

# User configuration
bindkey '^H' backward-kill-word
unsetopt share_history
setopt APPEND_HISTORY
eval "$(fasd --init auto)"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
