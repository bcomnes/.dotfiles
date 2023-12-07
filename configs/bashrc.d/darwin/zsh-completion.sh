# zsh completion
if [ -d "$(brew --prefix)/share/zsh-completions" ] && [[ -n "$ZSH_VERSION" ]]; then
  HOMEBREW_COMPLETIONS=$(brew --prefix)/share/zsh-completions
  CURRENT_COMPLETION="$( echo $FPATH )"
  if [[ ! $CURRENT_COMPLETION == *"${HOMEBREW_COMPLETIONS}"* ]]; then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
    autoload -Uz compinit
    compinit
  fi
fi
