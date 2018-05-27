# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=~/bin:$PATH
export GOPATH=~/go:/media/code/go-projects
GOPATHBINS=~/go/bin:/media/code/go-projects/bin
export PATH=$PATH:$GOPATHBINS
export PATH=$PATH:~/idea-IU/bin
export PATH=$PATH:~/.yarn/bin
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
bgnotify_threshold=7
plugins=(git gitfast git-extras colored-man-pages command-not-found copydir cp dircycle fasd tmuxinator bgnotify docker)

source $ZSH/oh-my-zsh.sh

# User configuration
bindkey '^H' backward-kill-word
unsetopt share_history
setopt APPEND_HISTORY RM_STAR_SILENT NO_HIST_VERIFY


# NVM
# Setup lazy loading for nvm, node, npm and potentially other cli stuff
NVM_INITIALIZED=false
function initialize_nvm(){
	if [ "$NVM_INITIALIZED" = false ];
	then
		# echo 'Initializing nvm'
		export NVM_DIR="$HOME/.nvm"
		[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
		NVM_INITIALIZED=true
	fi
}
function nvm(){
	initialize_nvm
	# export NVM_DIR="$HOME/.nvm"
	# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
	nvm $@
}

function node(){
	unset -f node
	initialize_nvm
	node $@
}
function npm(){
	unset -f npm
	initialize_nvm
	npm $@
}
function tldr(){
	unset -f tldr
	initialize_nvm
	tldr $@
}
function yarn(){
	unset -f yarn
	initialize_nvm
	yarn $@
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
bindkey '^F' fzf-file-widget
# Use ag to respect .agignore
export FZF_DEFAULT_COMMAND='ag --hidden -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# added by Anaconda3 installer
export PATH="/home/pewpew/anaconda3/bin:$PATH"
