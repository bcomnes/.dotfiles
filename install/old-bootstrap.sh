# install system updates
# install app store crap
# make dock big
# autohide dock
# hotcorner display sleep
# do not disturb
# enable sharing
# disable password and remote login
sudo -e /etc/ssh/sshd_config
# https://wiki.archlinux.org/index.php/Secure_Shell
# PermitRootLogin no
# PasswordAuthentication no
# ChallengeResponseAuthentication no

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew cask install dropbox 1password google-chrome

# set up dropbox and 1password and chrome

# Set up taps:

brew tap homebrew/command-not-found
brew tap homebrew/versions
brew tap homebrew/binary
brew tap Homebrew/bundle
brew tap homebrew/dupes
brew tap homebrew/services
brew tap homebrew/completions
brew tap caskroom/versions

# generate new ssh key
ssh-keygen -t ed25519 -C "your_email@example.com"

#add key to github 
cat ~/.ssh/id_ed25519.pub | pbcopy 

# set up authorized keys
curl https://github.com/bcomnes.keys > ~/.ssh/authorized_keys

# clone dotfiles
cd ~
git clone git@github.com:bcomnes/.dotfiles.git

# link dotfiles 

# set up vim
mkdir -p ~/.vim/{backup,colors,tmp,undo,view,bundle}
git clone git@github.com:gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# insatll homebrew crap
brew install bash cmake cowsay ffmpeg git git-lfs go htop lame mercurial mobile-shell ngrok node python python3 rsync ruby safe-rm tmux tree wget xhyve youtube-dl vim

# set up better bash
/usr/local/bin/bash to sudo -e etc/shells

# install atom plugins
apm stars --install

# install sublime text crap
cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
git clone git://github.com/wbond/sublime_package_control.git Package\ Control
cd ..
git init
git remote add origin git@github.com:bcomnes/sublime-text-settings.git
git fetch origin
git reset --hard origin/master
git branch --set-upstream-to=origin/master master


