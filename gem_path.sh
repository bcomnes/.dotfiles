# user gem path
# https://wiki.archlinux.org/index.php/Ruby#RubyGems
export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
