echo "Setting up ~/.dotfiles/ssh"

mkdir -p ~/.ssh
cd ~/.ssh

# a known_hosts file is created to bootstrap any git repos
# this will get in the way of linking our existing known_hosts file
# back up the bootstrap known_hosts and link in the one we want

# symlinking all of .ssh is scary, so lets just link
# the files we want to keep track of
for config in $HOME/.dotfiles/ssh/*; do
  config_basename=$(basename $config)
  if [ -f ./$config_basename ] && [ ! -L ./$config_basename ]; then
    echo "existing $config_basename file"
    echo "moving ~/.ssh/$config_basename to $config_basename.bk"
    mv ./$config_basename ./$config_basename.bk
  fi

  if [ -L ./$config_basename ]; then
    if [ $(readlink $config_basename) != $config ]; then
      echo "existing $config_basename symlink doesn't match $config"
      echo "moving ~/.ssh/$config_basename to $config_basename.symbk"
      mv ./$config_basename ./$config_basename.symbk
      echo "Linking $config to ~/.ssh/$config_basename"
      ln -s $config $config_basename
    else
      echo "Skipping ~/.ssh/$config_basename, alredy linked"
    fi
  else
    echo "Linking $config to ~/.ssh/$config_basename"
    ln -s $config $config_basename
  fi
done

echo "Downloading github keys for bcomnes"
github_keys=$(curl --silent --show-error --fail https://github.com/bcomnes.keys)
github_keys_sha=$( echo "$github_keys" | sha1sum | awk '{print $1;}' )
echo "Github keys sha: $github_keys_sha"

if [ -f ./authorized_keys ]; then
  if [ $(cat ./authorized_keys | sha1sum | awk '{print $1;}') != $github_keys_sha ]; then
    echo "existing ./authorized_keys file out of date"
    echo "moving existing ./authorized_keys to ./authorized_keys.bk"
    mv ./authorized_keys ./authorized_keys.bk
    echo "Writing bcomnes github keys to ./authorized_keys"
    echo "$github_keys" > ./authorized_keys
  else
    echo "Skipping Github bcomnes keys match ./authorized_keys... "
  fi
else
  echo "Writing bcomnes github keys to ./authorized_keys"
  echo "$github_keys" > ./authorized_keys
fi

echo "Fixing ssh permissions"
chmod go-w ~/
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
echo "Done fixing ssh permissions"

echo "Done setting up ~/.dotfiles/ssh"

#ok download authorized_keys "https://github.com/bcomnes.keys" --hash
