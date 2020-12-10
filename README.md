# dotfiles

To setup the environment in new computer, clone the repository as a bare repository as follows,

```
git clone --bare https://github.com/USERNAME/dotfiles.git $HOME/.dotfiles
```

Then set up the following alias to your current shell configuration,

```
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

Then checkout to the current config using,

```
dotfiles checkout
```

Additionally, set the following flag to the repository to avoid showing untracked file,

```
config config --local status.showUntrackedFiles no
```
