# OrbStack command-line tools and Zsh completions.
if [[ -n "$ZSH_VERSION" && -r "$HOME/.orbstack/shell/init.zsh" ]]; then
  source "$HOME/.orbstack/shell/init.zsh"
elif [[ -d "$HOME/.orbstack/bin" ]]; then
  export PATH="$PATH:$HOME/.orbstack/bin"
fi
