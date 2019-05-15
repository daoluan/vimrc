#! /bin/sh
#
# init.sh
# Copyright (C) 2018 dylanzheng <g.daoluan@gmail.com>
#
# Distributed under terms of the MIT license.
# 2018-09-19
#

cd ~/.vim_runtime/
git submodule update --init --recursive

cd ~/.vim_runtime/sources_non_forked/
git clone https://github.com/Valloric/YouCompleteMe.git
cd ~/.vim_runtime/sources_non_forked/YouCompleteMe/
git submodule update --init --recursive

cd ~/.vim_runtime/sources_non_forked/YouCompleteMe/third_party/
wget http://releases.llvm.org/6.0.0/clang+llvm-6.0.0-x86_64-linux-gnu-ubuntu-16.04.tar.xz
xz -d clang+llvm-6.0.0-x86_64-linux-gnu-ubuntu-16.04.tar.xz
tar xvf clang+llvm-6.0.0-x86_64-linux-gnu-ubuntu-16.04.tar
cd ~/.vim_runtime/sources_non_forked/YouCompleteMe/
apt install cmake
./install.py --clang-completer --go-completer


echo 'export PATH=$PATH:~/.vim_runtime/sources_non_forked/YouCompleteMe/third_party/clang+llvm-6.0.0-x86_64-linux-gnu-ubuntu-16.04/bin/' >> ~/.zshrc

# upgrade vim to 8.x
apt install software-properties-common
add-apt-repository ppa:jonathonf/vim
apt update
apt install vim

pip install autopep8
