#!/bin/bash
#
# Runs platform specific rc files

# https://gist.github.com/bcomnes/5053fca2d7be573c0abd
run_scripts()
{
  for script in $1/*; do

    # skip non-executable snippets and folders
    [ -f "$script" ] && [ -x "$script" ] || continue

    # execute $script in the context of the current shell
    . $script
  done
}


# https://gist.github.com/bcomnes/13711d12237e866de5ca
if [ "$(uname)" == "Darwin" ]; then
    # Do something under Mac OS X platform
    run_scripts ./darwin
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Do something under GNU/Linux platform
    run_scripts ./linux
    echo "loading linux"
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    # Do something under Windows NT platform
    run_scripts ./mingw32_nt
fi
