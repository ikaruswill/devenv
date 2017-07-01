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

# Install Bash 4
brew install bash
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
chsh -s /usr/local/bin/bash

# Install Python2 and Python3
brew install python
brew install python3

brew cleanup
