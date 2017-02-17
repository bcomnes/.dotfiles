#!/bin/bash

#
# platform.sh
#
# run platform specific scripts
#

run_scripts () {
  local script

  for script in $1/*; do

    # skip non-executable snippets and folders
    [ -f "$script" ] && [ -x "$script" ] || continue

	# execute $script in the context of the current shell
    . $script
  done
}

# http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in
# like __dirname from node.js
DIRNAME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Load Plaform specific scripts
# https://gist.github.com/bcomnes/13711d12237e866de5ca
if [ "$(uname)" == "Darwin" ]; then
    # Do something under Mac OS X platform
    run_scripts "$DIRNAME/darwin"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Do something under GNU/Linux platform
    run_scripts "$DIRNAME/linux"
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    # Do something under Windows NT platform
    run_scripts "$DIRNAME/mingw32_nt"
fi
