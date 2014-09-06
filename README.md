# Vim Support Files

A `vim` environment maintained in git with the help of [Vundle][]. See this [article on migrating from
Pathogen to Vundle][migrate].

[Vundle]: https://github.com/gmarik/Vundle.vim
[migrate]: http://blog.thomasupton.com/2014/02/migrating-from-pathogen-to-vundle/

## Setup

    $ git clone https://github.com/tupton/vim-support.git ~/.vim
    $ ln -s ~/.vim/vimrc ~/.vimrc
    $ cd ~/.vim
    $ ./bootstrap.sh # set up Vundle and plugins that need additional installation steps
