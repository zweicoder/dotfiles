export PATH=~/bin:$PATH
export GOPATH=~/go:/media/code/go-projects
GOPATHBINS=~/go/bin:/media/code/go-projects/bin
export PATH=$PATH:$GOPATHBINS
export PATH=$PATH:~/idea-IU/bin
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/home/czw/.pyenv/bin:$PATH"
# added by Anaconda3 installer
export PATH="/home/pewpew/anaconda3/bin:$PATH"

# NVM
# Hard code default to lts/carbon bin folder for spacemacs / CLI tools.
# This means node and other CLI tools will use this version until nvm is initialized
export NVMBIN=$HOME/.nvm/versions/node/v8.11.3/bin
export PATH=$PATH:$NVMBIN
# Setup lazy loading for nvm
NVM_INITIALIZED=false
function initialize_nvm(){
	if [ "$NVM_INITIALIZED" = false ];
	then
		# echo 'Initializing nvm'
		unset -f nvm
		export NVM_DIR="$HOME/.nvm"
		[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
		NVM_INITIALIZED=true
	fi
}
function nvm(){
	initialize_nvm
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

function yarn(){
	unset -f yarn
	initialize_nvm
	yarn $@
}

# pyenv
PYENV_INITIALIZED=false
function initialize_pyenv() {
	if [ "$PYENV_INITIALIZED" = false ] ;
	then
		eval "$(pyenv init -)"
		eval "$(pyenv virtualenv-init -)"
		PYENV_INITIALIZED=true
	fi
}
# Couldn't get this to work with spacemacs
if  [ -n "$(command -v pyenv)"  ];
then
	initialize_pyenv
fi
# function pyenv() {
# 	unset -f pyenv
# 	initialize_pyenv
# 	pyenv $@
# }

# function python() {
# 	unset -f python
# 	initialize_pyenv
# 	python $@
# }
# function pip() {
# 	unset -f pip
# 	initialize_pyenv
# 	pip $@
# }



