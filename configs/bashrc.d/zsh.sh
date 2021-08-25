# https://scriptingosx.com/2019/07/moving-to-zsh-part-5-completions/
# zsh completion
if [[ -n "$ZSH_VERSION" ]]; then
  autoload -Uz compinit
  compinit
  zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
fi
