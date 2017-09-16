#!/bin/bash

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
