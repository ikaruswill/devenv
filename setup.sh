echo "devenv setup script"

# Activate sudo and ask for password
sudo -v

# Keep sudo alive
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Get App Store login details
echo "Login to Apple AppStore"
echo "AppleID:"
read EMAIL
echo "Password:"
read APPSTORE_PW

# Execute scripts in order
chmod 744 *.sh
./brew.sh
./cask.sh
./git.sh
./appstore.sh
./conda.sh
./osx.sh
./bash.sh
./atom.sh
