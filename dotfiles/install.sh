#!/bin/bash
set -euo pipefail
if ! [ -d "$HOME/dotfiles" ]; then
  echo 'Setting up dotfiles...'
  if [ -z `command -v git` ];
  then
    echo '======================================================='
    echo '  Installing git...'
    echo '======================================================='
    sudo apt-get install python-software-properties
    sudo add-apt-repository ppa:git-core/ppa
    sudo apt-get update
    sudo apt-get install git
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
if [ "${make_cli_great_again,,}" == 'y' ];
then
  mkdir -p /tmp/dotfiles/ || true
  # Install zsh
  if [ -z `command -v zsh` ]; then
    echo '======================================================='
    echo '  Installing zsh...'
    echo '======================================================='
    sudo apt install zsh
    sudo chsh -s `which zsh`
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    echo 'Successfully installed zsh. Get better terminal colors from https://github.com/Mayccoll/Gogh'
  fi

  # Install oh my zsh
  if ! [ -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  fi

  # Fonts for powerline and nerdfonts for symbols. Might have to change Terminal font to Droid sans mono afterwards
  echo '======================================================='
  echo '  Installing fonts...'
  echo '======================================================='
  sudo apt install fonts-powerline
  mkdir -p ~/.local/share/fonts
  cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
  fc-cache -fv


  if ! [ -d "$HOME/.nvm" ];
  then
    echo '======================================================='
    echo '  Installing nvm...'
    echo '======================================================='
    wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
    #source ~/.bashrc
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
    nvm install lts/carbon
    nvm use lts/carbon
    echo 'Successfully installed nvm. Make sure the bin path in ~/.zshenv is same as lts/carbon version for bins to work'
  fi

  if [ -z `command -v bat` ];
  then
    echo '======================================================='
    echo '  Installing bat...'
    echo '======================================================='
    filename=/tmp/dotfiles/bat.deb
    wget -qO $filename https://github.com/sharkdp/bat/releases/download/v0.6.1/bat_0.6.1_amd64.deb
    sudo dpkg -i /tmp/dotfiles/bat.deb
  fi

  if [ -z `command -v fd` ];
  then
    echo '======================================================='
    echo '  Installing fd...'
    echo '======================================================='
    filename=/tmp/dotfiles/fd.deb
    wget -qO $filename https://github.com/sharkdp/fd/releases/download/v7.1.0/fd-musl_7.1.0_amd64.deb
    sudo dpkg -i /tmp/dotfiles/fd.deb
  fi

  echo '======================================================='
  echo '  Installing fzf...'
  echo '======================================================='
  $HOME/.fzf/install.sh

  echo '======================================================='
  echo '  Installing ag...'
  echo '======================================================='
  sudo apt-get -y install silversearcher-ag

  echo '======================================================='
  echo '  Terminal themes: https://github.com/Mayccoll/Gogh'
  echo '======================================================='

  echo 'Cleaning up...'
  rm -rf /tmp/dotfiles
fi

