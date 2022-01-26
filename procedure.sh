# DONT ACTUALLY RUN THIS SINCE MANY STEPS ARE BY HAND

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
# install terminal profile, switch
# install homebrew
# https://brew.sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# bootstrap brew and run
brew doctor
# Install bundle apps (maybe break a few out to boostrap phase)
cd ~/.dotfiles/
brew bundle

# set up 1Password

# generate ssh code: https://help.github.com/enterprise/2.10/user/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/
$ ssh-keygen -t ed25519 -C “new-computer-name”
# add public key to GitHub
cat ~/.ssh/id_ed25519.pub | pbcopy
# ADD TO GitHub
# https://github.com/settings/keys
# Update authorized keys on other hosts

# install dot files
cd ~/.dotfiles/bootstrap
./install-dotfiles.sh

# Fix zsh compaudit if its borked:
fix-compaudit

# Moom license and preference (1Password)

# Sublime Text
# https://github.com/bcomnes/sublime-text-settings
# add license

# VS Code
# Native setting sync

# Environment Stuff
mkdir ~/Developer
mkdir ~/go

# set up Resilio sync (set the name but link to existing ID)
# Accept a pro trial to get this working

# Safari Settings
#Review current settings
# developer tools
# show full toolbar
# do not track
# only current website cookies

# Internet accounts
# Download a fastmail profile
# https://www.fastmail.com/settings/security/devicekeys?u=70d94008
# Fix names, check if its working

# iTunes
# Podcasts n crap.  Sign in etc.

# iBooks
# sign in

# Finder
# show path bar
# show status barx
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

#Turn on FileVault

# Copy Music Folder over with Library.
# Hold option when launching and choose the copied library.
# Throw out the old one
#
# Podcasts coupy the 243LU875E5.groups.com.apple.podcasts folder in Library/Group Containers

# Move iPhone backup to new system

# Decomission notes
# unlink Resilio sync
# Dotfile audit
# Document audit
# Unlink iTunes
