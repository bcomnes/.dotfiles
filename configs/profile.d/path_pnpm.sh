# pnpm ~ global path
if [ -x "$(command -v pnpm)" ]; then
  export PNPM_HOME="$HOME/.local/share/pnpm"
  export PATH="$PNPM_HOME:$PNPM_HOME/bin:$PATH"
fi
