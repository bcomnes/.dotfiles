echo "Setting up Vim"

mkdir -p ~/.vim{backup,tmp,undo}

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

echo "Done setting up vim"
