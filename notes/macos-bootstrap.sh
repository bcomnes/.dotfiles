# Create vanilla macOS account without iCloud (so you control the username)
# Sidebar icon size: small
# Side: large
# Magnification: max
# Automatically hide and show the Dock: true
# Mission Control
# Group windows my application: true
# Hot corners: bottom right screen off
# Security and Privacy
# Show system location icon in menus bar when system services make request for location
# Notifications
# Do not disturb
# Enable
# Displays
# Enable night shift
# Trackpad
# Enable mouse options
# Enable zoom hotkey
# Apple Pay
# add cards
# Rename mac to desired username
# sign in with iCloud
# ensure App Store is signed in
# Touch ID enable


# Open terminal
# clone dot files
git clone https://github.com/bcomnes/.dotfiles.git
# install homebrew
# https://brew.sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
cd ~/.dotfiles/install/bret-netlify
brew bundle
sudo xcodebuild -license accept
git -C "$(brew --repo homebrew/core)" fetch --unshallow

# set up new BASH
# AUTOMATE THIS?
# Advanced options
sudoedit /etc/shells

# set up 1Password
# set up Resilio sync (set the name but link to existing ID)

# generate ssh code: https://help.github.com/enterprise/2.10/user/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/
$ ssh-keygen -t ed25519 -C “bret-netlify”
# add public key to GitHub
cat ~/.ssh/id_ed25519.pub | pbcopy
# ADD TO GitHub
# https://github.com/settings/keys
# update .dotfiles remote
git remote set-url origin git@github.com:bcomnes/.dotfiles.git
# props for password to cache it into keychain

# install dot files
#cd ~/.dotfiles/install/bret-netlify
# REPLACE BORK JESUS

# Vim
# vundle
# https://github.com/VundleVim/Vundle.vim
# CLEAN THIS SHIT UP THIS SUCKS
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# Moom license and preference

# Sublime Text
# https://github.com/bcomnes/sublime-text-settings
# add license

# Atom
apm install sync-settings
# Set up sync settings

# VS Code

# Environment Stuff
mkdir ~/repos
mkdir ~/netlify
mkdir ~/go

# Safari Settings
#Review current settings
# developer tools
# show full toolbar
# do not track
# only current website cookies

# Internet accounts
# Set up address book
# Set up me card

# iTunes
# Podcasts n crap.  Sign in etc.

# iBooks
# sign in

# Finder
# show path bar
# show status bar
# Show everything on desktop
# new windows open home
# show everything in sidebar
# all filenames and extensions
# clean trash after 30 days
# previous scope when searching

# Folder view options
# sort by name
# Show all info
# default!
# Sort by kind on desktop

# Dock
# - launchpad
# - preferences
# - ACtivity
# - Terminal
# - Safari
# - Mail
# - Things
# - Calendar
# - Messages
# - iTunes

# Background
# enable rotation


# TODO:
Dark mode via flux
Desktop background rotation
Turn on FileVault
System avatars


# Decomission notes
# unlink Resilio sync
