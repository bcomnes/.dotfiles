# Set atom home if atom is installed

if [ -x "$(command -v atom)" ]; then
  export ATOM_HOME="$HOME/.config/atom" ;
fi
