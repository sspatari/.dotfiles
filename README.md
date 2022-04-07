```zsh
: '
                                   _       _    __ _ _
                                  | |     | |  / _(_) |
                                __| | ___ | |_| |_ _| | ___  ___
                               / _` |/ _ \| __|  _| | |/ _ \/ __|
                              | (_| | (_) | |_| | | | |  __/\__ \
                               \__,_|\___/ \__|_| |_|_|\___||___/
                                --------------------------------
                                Add a dot in front of that file!
                         ----------------------------------------------

             -----------------------------------------------------------------------
             This repository is the collection of configurations that I learned over
             time and still use for my  daily work. The repository contains  configs
             files for vim,  tmux and etc.
             -----------------------------------------------------------------------

'
```

Dotfiles configurations used on all my linux/macos computers, inspired from [Storing dotfiles with Git - This is the way](https://engineeringwith.kalkayan.io/series/developer-experience/storing-dotfiles-with-git-this-is-the-way/)

## Git’s hidden gem: --bare
Bare repositories are special in the way that they omit the working directory. So, you can track files outside your Git repository, which is what we wanted all along. This does not mean doing ```cd $HOME && git init .``` and creating an exhaustive .gitignore with all the home directory content excluded from tracking (this is a horrible idea).

The trick to managing only a certain dotfile present in the $HOME directory as opposed to the entire directory itself is by creating a bare Git repository. As a first-time user of this method, provide --bare flag while creating your backup repository.

```zsh
# Notice the --bare flag; this initializes the repository as a git bare
git init --bare $HOME/.dotfiles
```

Bare repositories require a work-tree and git-directory on usage. Since the dotfiles live in the ```$HOME``` directory, the ```--work-tree``` argument is provided with ```$HOME``` as the value. This option merely tells Git where to look for the files; setting this to ```$HOME``` does not track its content. Apart from the working directory, Git also needs to know where the information about tracking lives. Therefore, ```--git-dir``` flag is set to the location of the bare repo, i.e., ```$HOME/.dotfiles```.

So, the backup repository can be operated with ```git --git-dir=$HOME/.dotfiles --work-tree=$HOME``` in the starting. For example, to check its status, run:

```zsh
git --git-dir=$HOME/.dotfiles --work-tree=$HOME status
```

Alias this mouthful command to ```git-dotfiles``` to use with ease.

```zsh
# Notice the --bare flag; this initializes the repository as a git bare
git init --bare $HOME/.dotfiles
alias git-dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
```

That was all for the setup, just one tiny flag, and one alias. Simple enough? There is no need to install anything, no chances of running into installation/build issues, or any other issues.

## Git prowesses for dotfiles

Tracking dotfiles are just like tracking files in any other Git repository. The regular Git workflow takes over, i.e., add, commit, push.

Example - Adding a file (```.vimrc``` in this example) for tracking.

```zsh
#  Notice, add and commit are done together. Feel free to use separate commands for the same.
git-dotfiles commit .vimrc -m ".vimrc added."

# Push new changes to GitHub, Bitbucket, Gitlab, or anywhere else.
git-dotfiles push origin main
```

Example - To check the state of the dotfiles repo.

```zsh
# to check the status of the tracked and untracked files
git-dotfiles status
```

The output of the above status command may contain all the home directory files. It is normal Git behavior to show all the untracked files in the directory. The fix for this is relatively simple, by updating the `git config` for the dotfiles repo.

```zsh
# Hides all the untracked files in the output
git-dotfiles config --local status.showUntrackedFiles no
```

With this done, managing dotfiles is good to go. The simplicity of tracking dotfiles, versioning, and managing is remarkable with Git.

## Beauty is in the minds of people

Besides painless management and sharing, this particular method has various other advantages like:

### Effortless Installation

The pre-eminence of using a bare repository for dotfiles is in installing them on a new machine. Just drop the ```--bare``` flag while cloning.

```zsh
git clone --bare https://github.com/<username>/dotfiles.git $HOME/.dotfiles && source ~/.zshrc
```

### Version History
If breaking things is a ritual, Git promotes experimenting with new configurations, eliminating the pain of finding the way back to the last working version. Basically, all the pros of using Git.

```zsh
# To check the version history
git-dotfiles log

# To checkout to last working version
git-dotfiles reset <commit-hash> --hard/soft
```

### Access across multiple devices

Share the same configs to multiple devices with minimal changes using **git branches**. Create a branch for your new machine.

```zsh
# Create configurations specific to your AWS machines
dotfiles checkout -b aws && source ~/.zshrc
```

### Environment enabled configurations profile

Allows the separation of configurations by creating profiles as **git branches** based on your environment. Create a branch, and update the configurations according to the env.

```zsh
# Checkout to different profiles as per the environment using branches
dotfiles checkout work && source ~/.zshrc
```

The list doesn’t end here. These are just some examples that I use daily. One can develop more practical usage of tracking dotfiles with Git.
