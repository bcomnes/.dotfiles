cd ~
#ok github bcomnes/.dotfiles

for config in $HOME/.dotfiles/configs/*; do
  ok symlink ".$(basename $config)" $config
done

cd ~/.ssh

for config in $HOME/.dotfiles/ssh/*; do
  ok symlink ".$(basename $config)" $config
done
