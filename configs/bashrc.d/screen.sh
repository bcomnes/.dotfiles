# Sets up 256 Color in vim under screen
# http://www.robmeerman.co.uk/unix/256colours
# Relates to something in .vimrc
if [ ! -z "$TERMCAP" ] && [ "$TERM" == "screen" ]; then
    export TERMCAP=$(echo $TERMCAP | sed -e 's/Co#8/Co#256/g')
fi
