# Dotfiles

## Setup
Put files into `~/dotfiles` directory, initialize a git repository and then set worktree to home:

```
cd ~/dotfiles git config core.worktree "../../"
# Hide untracked files
git config status.showUntrackedFiles no
```
 
## Usage
To clone on another machine:

Use the install script:
`curl https://raw.githubusercontent.com/zweicoder/dotfiles/master/dotfiles/install.sh | bash`

Manually:

```
git clone --no-checkout https://github.com/zweicoder/dotfiles.git
cd dotfiles
git config core.worktree "../../"
# Now, we can explicitly checkout the files. Again, we need to force git to overwrite our current files. 
# We can do that by "resetting" back to the state that the files were in from our remote repo:
git reset --hard origin/master

# Install submodules
cd ~
echo "gitdir: /home/`whoami`/dotfiles/.git" > ~/.git
git submodule update --init

git config status.showUntrackedFiles no
```
