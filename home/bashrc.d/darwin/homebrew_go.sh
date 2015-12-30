#!/bin/bash

#homebrew go stuff
if [ -d $(brew --prefix go)/libexec/bin ]; then
  export PATH=$PATH:$(brew --prefix go)/libexec/bin ;
fi
