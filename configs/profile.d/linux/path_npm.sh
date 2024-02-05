# npm ~ global path
# https://docs.npmjs.com/getting-started/fixing-npm-permissions
if [ -x "$(command -v npm)" ]; then
	export NPM_CONFIG_PREFIX=~/.npm-global
  export PATH="$(npm config get prefix)/bin:$PATH";
fi
