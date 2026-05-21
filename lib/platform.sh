#
# platform.sh
#
# run platform specific scripts
# shared by all .d directories via symlink - run_scripts is defined by the entry point
#

# http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in
# like __dirname from node.js
if [ -n "$ZSH_VERSION" ]; then
   DIRNAME="$( cd "$( dirname "${(%):-%N}" )" && pwd )"
elif [ -n "$BASH_VERSION" ]; then
   DIRNAME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
else
   # asume something else
   echo "Skipping platform... unsuported shell"
   return
fi


# Load Platform specific scripts
# https://gist.github.com/bcomnes/13711d12237e866de5ca
if [[ "$(uname)" == "Darwin" ]]; then
    run_scripts "$DIRNAME/darwin"
elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]; then
    run_scripts "$DIRNAME/linux"
elif [[ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]]; then
    run_scripts "$DIRNAME/mingw32_nt"
fi
