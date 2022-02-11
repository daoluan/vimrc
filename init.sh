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

download_prefix=https://releases.llvm.org/6.0.0
if [ "$(uname)" == "Darwin" ]; then
    file="clang+llvm-6.0.0-x86_64-apple-darwin"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    file="clang+llvm-6.0.0-x86_64-linux-gnu-ubuntu-16.04"
fi

url=${download_prefix}/${file}

wget "$url.tar.xz"
xz -d "$file.tar.xz"
tar xv "$file.tar"

echo "export PATH=$PATH:~/.vim_runtime/sources_non_forked/YouCompleteMe/third_party/${file}" >> ~/.zshrc

# upgrade vim to 8.x
# add-apt-repository ppa:jonathonf/vim
# apt update
# apt install vim

pip install autopep8
