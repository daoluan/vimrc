#! /bin/sh
#
# merge_upstream.sh
# Copyright (C) 2020 dylanzheng <g.daoluan@gmail.com>
#
# Distributed under terms of the MIT license.
#

git remote add upstream https://github.com/amix/vimrc.git
git fetch upstream
git merge -X theris upstream/master
