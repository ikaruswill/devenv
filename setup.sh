#!/usr/bin/env bash

# Set fonts for help menu
NORM=`tput sgr0`
BOLD=`tput bold`
REV=`tput smso`

echo "${REV}                                                            ${NORM}"
echo "${REV}                    devenv: Setup script                    ${NORM}"
echo "${REV}                                                            ${NORM}"
echo ""

# Activate sudo and ask for password
sudo -v

# Keep sudo alive
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Get email and sign in to App Store
echo "Login to Apple App Store"
read -p "Apple ID: " EMAIL
mas signin $EMAIL

# Execute scripts in order
SCRIPTS_DIR=setup_scripts
chmod 744 $SCRIPTS_DIR/*.sh
$SCRIPTS_DIR/cask.sh
$SCRIPTS_DIR/git.sh
$SCRIPTS_DIR/appstore.sh
$SCRIPTS_DIR/conda.sh
$SCRIPTS_DIR/osx.sh
$SCRIPTS_DIR/bash.sh
$SCRIPTS_DIR/atom.sh

echo ""
echo "${REV}                       ${BOLD}Setup complete${REV}                       ${NORM}"
