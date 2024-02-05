# brew sbin
if [[ -d "$(brew --prefix)/sbin" ]] && [[ ! $PATH == *"$(brew --prefix)/sbin"*  ]]; then
  export PATH=$PATH:$(brew --prefix)/sbin ;
fi
