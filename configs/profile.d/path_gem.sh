# user gem path
# https://wiki.archlinux.org/index.php/Ruby#RubyGems
if command -v ruby &> /dev/null; then
    export PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
fi
