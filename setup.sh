#! /usr/bin/env bash

AUTOLOAD_DIR=$HOME/.vim/autoload

if [ ! -d "$AUTOLOAD_DIR" ]; then
  mkdir -p $AUTOLOAD_DIR
  echo "Created vim autoload dir"
fi

if [ ! -f "$AUTOLOAD_DIR/pathogen.vim" ]; then
  cp vim-pathogen/autoload/pathogen.vim $AUTOLOAD_DIR/pathogen.vim
  echo "Installed pathogen"
fi

if [ -d Command-T ] ; then
  cd Command-T/ruby/command-t/
  ruby extconf.rb && make
  cd ../../../
  echo "Compiled Command-T native part"
fi

echo "All done"
