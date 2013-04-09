#! /bin/bash

AUTOLOAD_DIR=$HOME/.vim/autoload

if [ ! -d "$AUTOLOAD_DIR" ]; then
  mkdir -p $AUTOLOAD_DIR
  echo "Created vim autoload dir"
fi

if [ ! -f "$AUTOLOAD_DIR/pathogen.vim" ]; then
  cp vim-pathogen/autoload/pathogen.vim $AUTOLOAD_DIR/pathogen.vim
  echo "Installed pathogen"
fi

echo "All done"
