# homebrew nvm

# Uninstall homebrew node before enabling this

if [ -f "$(brew --prefix)/opt/nvm/nvm.sh" ] && [ ! -d "$HOME/.nvm" ]; then
  mkdir "$HOME/.nvm"
fi

if [[ -f "$(brew --prefix)/opt/nvm/nvm.sh" ]]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
fi
