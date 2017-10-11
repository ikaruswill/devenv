# Update OS X
sudo softwareupdate -iva

# Install Xcode command line tools
xcode-select --install

brew install dark-mode # Activate OS X dark mode via cli
dark-mode on
brew remove dark-mode

# Install inconsolata font family
mkdir inconsolata
pushd inconsolata
wget https://github.com/google/fonts/blob/master/ofl/inconsolata/Inconsolata-Regular.ttf
wget https://github.com/google/fonts/blob/master/ofl/inconsolata/Inconsolata-Bold.ttf
cp * ~/Library/Fonts/
popd
rm -r inconsolata

# Remove GarageBand
rm -rf /Applications/GarageBand.app
rm -rf /Library/Application\ Support/GarageBand
rm -rf /Library/Application\ Support/Logic/
rm -rf /Library/Audio/Apple\ Loops
rm -rf /Library/Audio/Apple\ Loops\ Index

# Remove other MacOS default Apps
rm -rf /Applications/iMovie.app
rm -rf /Applications/Keynote.app
rm -rf /Applications/Numbers.app
rm -rf /Applications/Pages.app
