echo "devenv setup script"

echo "Standby for password prompts"

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
read -n 1 -s -r -p "Press any key to proceed with non-interactive environment setup"

#### END OF INTERACTIVE COMMANDS ####


# Install python3 for ansible
if test ! $(which python3); then
    echo "Installing python3..."
    brew install python3
fi

echo "Installing ansible in venv"
python3 -m venv ./venv
source ./venv/bin/activate

if test ! $(which ansible); then
    echo "Installing ansible..."
    pip install ansible
fi

chmod 744 *.sh
