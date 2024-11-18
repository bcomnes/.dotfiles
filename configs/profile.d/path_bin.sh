if [[ -d ~/.dotfiles/bin ]]; then
	export PATH=~/.dotfiles/bin:$PATH;
fi

# ensure ~/bin is in $PATH
if [[ -d ~/bin ]]; then
	export PATH=~/bin:$PATH;
fi

