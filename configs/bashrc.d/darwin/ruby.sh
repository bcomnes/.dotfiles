# brew sbin
if [[ -d "$(brew --prefix)/opt/ruby/bin" ]]; then
  export PATH=$PATH:$(brew --prefix)/opt/ruby/bin;
fi
