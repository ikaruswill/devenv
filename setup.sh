#!/usr/bin/env bash

# Set fonts for help menu
NORM=`tput sgr0`
BOLD=`tput bold`
REV=`tput smso`

echo "${REV}                                                            ${NORM}"
echo "${REV}                    devenv setup script                     ${NORM}"
echo "${REV}                                                            ${NORM}"
echo ""

# Activate sudo and ask for password
sudo -v

# Keep sudo alive
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Get email and sign in to App Store
echo "Login to Apple App Store"
echo "Apple ID:"
read EMAIL
mas signin $EMAIL

chmod 744 *
setup_scripts/brew.sh
setup_scripts/cask.sh
setup_scripts/git.sh
setup_scripts/appstore.sh
setup_scripts/conda.sh
setup_scripts/osx.sh
setup_scripts/bash.sh
setup_scripts/atom.sh
