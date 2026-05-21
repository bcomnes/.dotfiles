# Disabled — not sure if PEAR is still needed. Re-enable by making this file executable.
if [ -x "$(command -v pear)" ]; then
  export PATH="$HOME"/Library/Application\ Support/pear/bin:"$PATH"
fi
