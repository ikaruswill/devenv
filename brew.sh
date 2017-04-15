#!/usr/bin/env bash

# Check if brew exists
# ruby -e: single command mode
# curl -f: fail silently
# curl -s: silent mode
# curl -S: show errors
# curl -L: follow redirects
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

brew install git

# Install default python interpreters
# To avoid messing with OS X python
brew install python
brew install python3

brew install docker
brew install node

# Install cask
brew install caskroom/cask/brew-cask

# Install mac productivity tools
brew cask install alfred # License
brew cask install iterm2
brew cask install bartender # License
brew cask install fantastical # License
brew cask install flux
brew cask install spectacle
brew cask install the-unarchiver
brew cask install android-file-transfer

# Install developer tools
brew cask install sublime-text
brew cask install atom
brew cask install brackets
brew cask install postman
brew cask install gitkraken
brew cask install java

# Install database tools
brew cask install sequel-pro
brew cask install postico

# Install virtualization tools
brew cask install virtualbox
brew cask install vagrant

# Install general productivity tools
brew cask install firefox
brew cask install google-chrome
brew cask install opera
brew cask install dropbox
brew cask install google-drive
brew cask install adobe-reader

# Install media apps
brew cask install franz
brew cask install vox
brew cask install vlc

brew cleanup
