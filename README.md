# Deprecated

This separate vim config environment repository is deprecated. See my [vim config directory][vim] and related [Make targets][make-vim] (current as of this writing; you might want to update to HEAD to see any updates or changes) in my [dotfiles repository][dotfiles] for more information.

I originally separated this repository because I was experimenting with submodules with Pathogen. Since I don't use Pathogen or submodules any more, and because I need to set up my environment on cloud instances with considerable frequency, I decided to consolidate and prune.

  [vim]: https://github.com/tupton/dotfiles/tree/master/vim
  [make-vim]: https://github.com/tupton/dotfiles/blob/7b75549eb476eb80540159d3c5768760336c2195/Makefile#L74-L100
  [dotfiles]: https://github.com/tupton/dotfiles

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
