# zsh completion
if [ -d "$(brew --prefix)/share/zsh-completions" ] && [[ -n "$ZSH_VERSION" ]]; then
  HOMEBREW_COMPLETIONS=$(brew --prefix)/share/zsh-completions
  CURRENT_COMPLETION="$( echo $fpath )"
  if [[ ! $CURRENT_COMPLETION == *"${HOMEBREW_COMPLETIONS}"* ]]; then
    fpath=($HOMEBREW_COMPLETIONS $fpath)
  fi
fi
