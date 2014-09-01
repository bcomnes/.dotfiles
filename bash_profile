export HOMEBREW_ROOT=/usr/local

# Set user path
# homebrew
PATH=$HOMEBREW_ROOT/bin:$HOMEBREW_ROOT/sbin:$PATH

# Ruby
#PATH=$HOMEBREW_ROOT/opt/ruby/bin:$PATH
# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# This sets up the cabal (haskell platform)m
PATH=$PATH:$HOME/.cabal/bin

# Go path
# See http://golang.org/doc/code.html#GOPATH
export GOPATH=$HOME/.go
# Go bin path (from homebrew)
PATH=$PATH:$GOPATH/bin:$HOMEBREW_ROOT/Cellar/go/1.2/libexec/bin
# Camlistore path
PATH=$PATH:$GOPATH/src/camlistore.org/bin

export PATH

export EDITOR=VIM
#export GIT_EDITOR="subl --wait --new-window"

# Enables terminal colors
# found at
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Enable .bashrc
# If running bash
if [ -n "$BASH_VERSION" ]; then
# include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# Enable .bash_aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Enable bash-completion2
if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
   . $(brew --prefix)/share/bash-completion/bash_completion
fi

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

