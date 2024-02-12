# linking homebrew keg only ruby into the path
if [[ -d "$(brew --prefix)/opt/ruby/bin" ]]; then
  export PATH=$(brew --prefix)/opt/ruby/bin:$PATH;
  #export PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
fi
