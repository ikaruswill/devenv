echo "devenv setup script"

# Activate sudo and ask for password
sudo -v

# Keep sudo alive
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Get email
echo "Login to Apple AppStore"
echo "AppleID:"
read EMAIL
echo "Password:"
read APPSTORE_PW

chmod 744 *
./brew.sh
./appstore.sh
./conda.sh
./osx.sh
