# brew sbin
if [[ -d "$(brew --prefix)/opt/ruby/bin" ]]; then
  export PATH=$(brew --prefix)/opt/ruby/bin:$PATH ;
fi
