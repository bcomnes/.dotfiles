#homebrew go stuff
# Is this still needed?
if [ -d $(brew --prefix go)/libexec/bin ]; then
  export PATH=$PATH:$(brew --prefix go)/libexec/bin ;
fi
