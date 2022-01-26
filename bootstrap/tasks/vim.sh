echo "Setting up Vim"

mkdir -p ~/.vim/{backup,tmp,undo}

if [[ ! -d ~/.vim/bundle/Vundle.vim ]]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
  pushd ~/.vim/bundle/Vundle.vim
  git pull
  popd
fi

vim +PluginInstall +qall

echo "Done setting up vim"
