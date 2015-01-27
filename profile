# Use to set non-bash env vars

# Editors
export EDITOR='vim'
export VISUAL='subl'
export GIT_EDITOR='vim'

# Enable ansible generated .env
if [ -f $HOME/.env ]; then
    source $HOME/.env
fi
