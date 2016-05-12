cd ~
ok github bcomnes/.dotfiles --ssh
for config in $HOME/.dotfiles/configs/*; do
  ok symlink ".$(basename $config)" $config
done
