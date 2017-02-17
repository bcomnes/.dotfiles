# user gem path
# https://wiki.archlinux.org/index.php/Ruby#RubyGems
export PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
