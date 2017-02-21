cd ~/.ssh

# a known_hosts file is created to bootstrap any git repos
# this will get in the way of linking our existing known_hosts file
# back up the bootstrap known_hosts and link in the one we want
ok check [ -L ./known_hosts ]
if check_failed; then
  echo "existing known_hosts file exists"
  echo "moving ~/.ssh/known_hosts to ./known_hosts.bk"
  mv ./known_hosts ./known_hosts.bk
fi

# symlinking all of .ssh is scary, so lets just link
# the files we want to keep track of
for config in $HOME/.dotfiles/ssh/*; do
  ok symlink "$(basename $config)" $config
done

ok download authorized_keys "https://github.com/bcomnes.keys" --hash
