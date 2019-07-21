# Set docker home if atom is installed

if [ "$(command -v docker)" ]; then
  export DOCKER_CONFIG="$HOME/.config/docker" ;
fi
