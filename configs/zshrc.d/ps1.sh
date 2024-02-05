# zsh ps1

if [[ -n "$ZSH_VERSION" ]]; then
   PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b %# '
else
   # asume something else
   :
fi
