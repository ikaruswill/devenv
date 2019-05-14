#!/usr/bin/env bash

# Set fonts for help menu
NORM=`tput sgr0`
BOLD=`tput bold`
REV=`tput smso`

echo "${REV}                                                            ${NORM}"
echo "${REV}                ${BOLD}devenv${NORM}${REV}: Ansible setup script                ${NORM}"
echo "${REV}                                                            ${NORM}"
echo ""
echo "Standby for password prompts..."

# Check if homebrew exists else install
# ruby -e: single command mode
# curl -f: fail silently
# curl -s: silent mode
# curl -S: show errors
# curl -L: follow redirects
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if test ! $(which mas); then
    echo "Installing mas..."
    brew install mas
fi

# Activate sudo and ask for password
echo "Prompting for sudo password, will keep sudo alive"
sudo -v

# Keep sudo alive
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Get email and sign in to App Store
echo "Login to Apple App Store"
read -p "Apple ID: " EMAIL
mas signin $EMAIL

echo "End of interactive commands"
read -n 1 -s -r -p "Press any key to proceed with non-interactive environment setup..."
echo ""

#### END OF INTERACTIVE COMMANDS ####

# Install python3 for ansible
if test ! $(which python3); then
    echo "Installing python3..."
    brew install python3
fi

# Setup and activate venv
ANSIBLE_DIR=ansible
VENV_DIR=$ANSIBLE_DIR/venv
echo "Activating venv..."
python3 -m venv $VENV_DIR
source $VENV_DIR/bin/activate

# Install ansible in venv
if test ! $(which ansible); then
    echo "Installing ansible and dependencies in venv..."
    pip install -r $ANSIBLE_DIR/requirements.txt
fi

# Symlink role files/config to actual config folder
ANSIBLE_CONFIGS_LINK=ansible/roles/system/files/configs
CONFIGS_FOLDER=$(pwd)/configs
echo "Symlinking configs directory to ansible system role..."
rm -rf $ANSIBLE_CONFIGS_LINK
ln -s $CONFIGS_FOLDER $ANSIBLE_CONFIGS_LINK

# Run ansible playbook
pushd $ANSIBLE_DIR;
ansible-playbook ikaruswill-env.yml --ask-become-pass
popd;

# Remove temporal symlink
echo "Removing configs symlink..."
rm -rf $ANSIBLE_CONFIGS_LINK

# Remove venv
echo "Deactivating and removing venv"
deactivate
rm -rf $VENV_DIR

echo ""
echo "${REV}                       ${BOLD}Setup complete${REV}                       ${NORM}"
