#!/bin/bash
set -euo pipefail
if ! [ -d "$HOME/dotfiles" ]; then
	echo 'Setting up dotfiles...'
	if [ -z `command -v git`];
	then
		echo 'Please install git'
		exit 0
	fi

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
fi


echo -n 'Install CLI awesomeness? Y/n '
read make_cli_great_again
if [ $make_cli_great_again == 'Y' ];
then
	mkdir -p /tmp/dotfiles/ || true
	if [ -z `command -v zsh` ]; then
		echo '======================================================='
		echo '	Installing zsh...'
		echo '======================================================='
		sudo apt install zsh
		sudo chsh -s `which zsh`
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	fi

	if ! [ -d "$HOME/.nvm" ];
	then
		echo '======================================================='
		echo '	Installing nvm...'
		echo '======================================================='
		exit 1
		wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
		source ~/.bashrc
		nvm install lts/carbon
		nvm use lts/carbon
	fi

	if [ -z `command -v bat` ];
	then
		echo '======================================================='
		echo '	Installing bat...'
		echo '======================================================='
		filename=/tmp/dotfiles/bat.deb
		wget -qO $filename https://github.com/sharkdp/bat/releases/download/v0.6.1/bat_0.6.1_amd64.deb
		sudo dpkg -i /tmp/dotfiles/bat.deb
	fi

	if [ -z `command -v fd` ];
	then
		echo '======================================================='
		echo '	Installing fd...'
		echo '======================================================='
		filename=/tmp/dotfiles/fd.deb
		wget -qO $filename https://github.com/sharkdp/fd/releases/download/v7.1.0/fd-musl_7.1.0_amd64.deb
		sudo dpkg -i /tmp/dotfiles/fd.deb
	fi

	echo 'Cleaning up...'
	rm -rf /tmp/dotfiles
fi




# echo -n 'Install misc. CLI goodies? Y/n'
# read install_cli_goodies
# if [ $install_cli_goodies == 'Y' ];
# then
# fi
