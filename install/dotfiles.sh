cd ~
ok github bcomnes/.dotfiles
for config in $HOME/.dotfiles/configs/*; do
  ok symlink ".$(basename $config)" $config
done

cd ~/.ssh
ok check [ -L ./known_hosts ]
if check_failed; then
  echo "moving ~/.ssh/known_hosts to ./known_hosts.bk"
  mv ./known_hosts ./known_hosts.bk
fi

for config in $HOME/.dotfiles/ssh/*; do
  ok symlink "$(basename $config)" $config
done
