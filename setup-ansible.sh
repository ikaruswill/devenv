#!/usr/bin/env bash

# Set fonts for help menu
NORM=`tput sgr0`
BOLD=`tput bold`
REV=`tput smso`

echo "${REV}                                                            ${NORM}"
echo "${REV}                devenv-ansible setup script                 ${NORM}"
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
echo "Apple ID:"
read EMAIL
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
echo "Activating venv"
python3 -m venv ./venv
source ./venv/bin/activate

# Install ansible in venv
if test ! $(which ansible); then
    echo "Installing ansible in venv..."
    pip install ansible
fi

ANSIBLE_CONFIGS_LINK=ansible/roles/system/files/configs
CONFIGS_FOLDER=$(pwd)/configs

# Symlink role files/config to actual config folder
rm -rf $ANSIBLE_CONFIGS_LINK
ln -s $CONFIGS_FOLDER $ANSIBLE_CONFIGS_LINK

# Run ansible playbook
ansible-playbook ansible/ikaruswill-env.yml -i localhost,

# Remove temporal symlink
rm -rf $ANSIBLE_CONFIGS_LINK
