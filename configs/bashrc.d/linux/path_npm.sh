# npm ~ global path
# https://docs.npmjs.com/getting-started/fixing-npm-permissions
if [ -x "$(command -v docker)" ]; then
  export PATH="$(npm config get prefix)/bin:$PATH";
fi
