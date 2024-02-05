# https://unix.stackexchange.com/questions/383365/zsh-compinit-insecure-directories-run-compaudit-for-list
alias fix-compaudit="compaudit | xargs chmod g-w"