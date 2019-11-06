# brew sbin
if [[ -d "$(brew --prefix)/sbin" ]] && [[ ! $PATH == *"$(brew --prefix)/sbin"*  ]]; then
  echo 'ACTIVE'
  export PATH=$PATH:$(brew --prefix)/sbin ;
fi
