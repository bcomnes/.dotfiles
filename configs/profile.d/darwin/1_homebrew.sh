export HOMEBREW_NO_ANALYTICS=1
if [ "$(command -v /opt/homebrew/bin/brew)" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  if [[ -d /opt/homebrew ]] && [ ! "$(command -v brew)" ]; then
    export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
  fi
fi
