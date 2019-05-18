# bash completion 2
if [ -f "$(brew --prefix)/etc/profile.d/bash_completion.sh" ] && [ "${BASH_VERSINFO:-0}" -ge 4 ]; then
  export BASH_COMPLETION_COMPAT_DIR="$(brew --prefix)/etc/bash_completion.d"
  . $(brew --prefix)/etc/profile.d/bash_completion.sh ;
fi
