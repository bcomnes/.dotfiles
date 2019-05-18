echo "Setting up ~/.dotfiles/configs"
cd ~

for config in $HOME/.dotfiles/configs/*; do
  # Note the addition of the period here
  config_basename=.$(basename $config)

  if [ -f ./$config_basename ] && [ ! -L ./$config_basename ]; then
    # If a file or directory and NOT a link
    echo "existing $config_basename file"
    echo "moving ~/$config_basename to $config_basename.bk"
    mv ./$config_basename ./$config_basename.bk
  fi

  if [ -L ./$config_basename ]; then
    if [ $(readlink $config_basename) != $config ]; then
      echo "existing $config_basename symlink doesn't match $config"
      echo "moving ~/$config_basename to $config_basename.symbk"
      mv ./$config_basename ./$config_basename.symbk
      echo "Linking $config to ~/$config_basename"
      ln -s $config $config_basename
    else
      echo "Skipping ~/$config_basename, alredy linked"
    fi
  else
    echo "Linking $config to ~/$config_basename"
    ln -s $config $config_basename
  fi
done

echo "Done setting up ~/.dotfiles/configs"
