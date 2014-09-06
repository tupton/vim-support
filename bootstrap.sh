#! /usr/bin/env bash

set -x

git clone https://github.com/gmarik/Vundle.vim bundle/Vundle.vim
vim +PluginInstall +qall

cd bundle/YouCompleteMe
./install.sh
cd -

cd bundle/tern_for_vim
npm install
cd -
