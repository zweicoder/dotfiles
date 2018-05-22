#!/bin/bash
set -euo pipefail
if [ -z `command -v git`]; then
then
	echo 'Please install git'
	exit 0
fi

echo 'Setting up dotfiles...'
git clone --no-checkout https://github.com/zweicoder/dotfiles.git
cd ~/dotfiles
git config core.worktree "../../"
# Now, we can explicitly checkout the files. Again, we need to force git to overwrite our current files. 
# We can do that by "resetting" back to the state that the files were in from our remote repo:
git reset --hard origin/master

# Install submodules
cd ~
echo "gitdir: $HOME/dotfiles/.git" > ~/.git
git submodule update --init

# Don't show untracked files
git config status.showUntrackedFiles no

if [ -z `command -v zsh` ]; then
	echo -n 'Install zsh config? Y/n'
	read install_zsh
	if [ $install_zsh == 'Y' ]; then
		sudo apt install zsh
		sudo chsh -s `which zsh`
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	fi
fi

if [ -z `command -v nvm`];
then
	echo -n 'Install nvm? Y/n'
	read install_nvm
	if [ $install_nvm == 'Y' ]; then
		wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
		source ~/.bashrc
		nvm install lts/carbon
		nvm use lts/carbon
	fi
fi

# echo -n 'Install misc. CLI goodies? Y/n'
# read install_cli_goodies
# if [ $install_cli_goodies == 'Y' ];
# then
# fi
