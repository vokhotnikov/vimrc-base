#! /usr/bin/env bash

set -u
set -e

if [ ! -d bundles ] ; then
  mkdir -p bundles
  if [ ! -d bundles/Vundle.vim ] ; then
    git clone https://github.com/VundleVim/Vundle.vim.git bundles/Vundle.vim
    echo "Vundle installed"
  fi
fi

if [ -d Command-T ] ; then
  cd Command-T/ruby/command-t/
  ruby extconf.rb && make
  cd ../../../
  echo "Compiled Command-T native part"
fi

echo "All done"
