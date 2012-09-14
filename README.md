# Vim Support Files

A Vim environment maintained in git with the help of [pathogen][] and this [article on synchronizing
plugins with git and pathogen][sync].

[pathogen]: http://www.vim.org/scripts/script.php?script_id=2332
[sync]: http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/

## Setup

    $ git clone https://github.com/tupton/vim-support.git ~/.vim
    $ ln -s ~/.vim/vimrc ~/.vimrc
    $ cd ~/.vim
    $ git submodule update --init
