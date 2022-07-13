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
             time and still use for my daily work. The repository contains configs
             files for vim, tmux and etc.
             -----------------------------------------------------------------------

'
```
# How to use it

1. Install stow `GNU Stow` for you OS. Example for MacOS `brew install stow`
2. Clone this repo inside your `$HOME` directory, and `cd` into it.
```zsh
git clone git@github.com:sspatari/.dotfiles.git
cd .dotfiles
```
3. Use either `stow .` to install all or `stow` each folder separatly
