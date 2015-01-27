# .bash_profile
# Bash Specific env vars
# http://superuser.com/questions/789448/choosing-between-bashrc-profile-bash-profile-etc

# Simplify dotfile loading:
# http://superuser.com/questions/183870/difference-between-bashrc-and-bash-profile
if [ -r ~/.profile ]; then . ~/.profile; fi
case "$-" in *i*) if [ -r ~/.bashrc ]; then . ~/.bashrc; fi;; esac

# Colors
# Enables terminal colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
# Sets the color of the root prompt
export SUDO_PS1="\[\e[33;1;41m\][\u] \w \$\[\e[0m\] "
# Sets the color of the default prompt.  I did it myself!
export PS1="\[\e[33;1;32m\]\h:\[\e[33;1;34m\]\W \u\$\[\e[0m\] "
# Sets up 256 Color in VI under screen
# http://www.robmeerman.co.uk/unix/256colours
# Relates to something in .vimrc
if [ ! -z "$TERMCAP" ] && [ "$TERM" == "screen" ]; then
    export TERMCAP=$(echo $TERMCAP | sed -e 's/Co#8/Co#256/g')
fi

# Enable .bash_aliases
if [ -f $HOME/.bash_aliases ]; then
    source $HOME/.bash_aliases
fi
