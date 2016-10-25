# Dotfiles

## Setup
Put files into `~/dotfiles` directory, initialize a git repository and then set worktree to home:

```
cd ~/dotfiles
git config core.worktree "../../"
# Hide untracked files
git config status.showUntrackedFiles no
```
 
## Usage
To pull config:

```
cd ~
echo "gitdir: /home/your_user/configs/.git" > .git
```
