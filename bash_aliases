# Use this file for creating aliases.  You need to
# load this file in .bashrc
# All changes below made by boot


# alias' for screen
alias sr='screen -r'
alias srd='screen -rd'
alias sl='screen -ls'

# stuff to see what is going on with the terminal
alias term='echo $TERM'
alias path='echo $PATH'

# access colored man pages
#alias manc='man -P /usr/bin/most $1'
# This is a mod to use the brewed path from homebrew
alias manc='man -P /usr/local/bin/most $1'

#backs up lukanonet
alias backuplukanonet='rsync -e ssh -av lukanonet:~/ ~/Documents/bash\ shells/LukanoNet/'

# shortcut for task warrior
alias t='task'
alias todayh='task add due:today pri:h'
alias todaym='task add due:today pri:m'
alias todayl='task add due:today pri:l'
alias today='task add due:today'
alias inbox='task pro:'

alias taskmergelocal='task merge /Volumes/Bret/.task/'

# shortcut to open finder in current directory
alias finder='open .'

alias emacs="/usr/local/Cellar/emacs/24.1/Emacs.app/Contents/MacOS/Emacs -nw"

