# Update OS X
sudo softwareupdate -iva

# Install Xcode command line tools
xcode-select --install

# Activate OS X dark mode via cli
brew install dark-mode
dark-mode on
brew remove dark-mode

# Disable automatic rearrangement of spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Remove GarageBand
rm -rf /Applications/GarageBand.app
rm -rf /Library/Application\ Support/GarageBand
rm -rf /Library/Application\ Support/Logic/
rm -rf /Library/Audio/Apple\ Loops
rm -rf /Library/Audio/Apple\ Loops\ Index

# Remove other MacOS default Apps
# rm -rf /Applications/iMovie.app
# rm -rf /Applications/Keynote.app
# rm -rf /Applications/Numbers.app
# rm -rf /Applications/Pages.app

# Disable auto-launch on USB connect for Android File Transfer
PID=$(ps -fe | grep "[A]ndroid File Transfer Agent" | awk '{print $2}')
if [[ -n $PID ]]; then kill $PID; fi
chmod 000 $HOME/Library/Application\ Support/Google/Android\ File\ Transfer/Android\ File\ Transfer\ Agent.app
sudo chown root:wheel ~/Library/Application\ Support/Google/Android\ File\ Transfer/Android\ File\ Transfer\ Agent.app
# Undo:
# sudo chown $UID:staff ~/Library/Application\ Support/Google/Android\ File\ Transfer/Android\ File\ Transfer\ Agent.app
# chmod 755 $HOME/Library/Application\ Support/Google/Android\ File\ Transfer/Android\ File\ Transfer\ Agent.app

# # Alternative method: Does not persist through AFT updates or reinstalls
# mv "/Applications/Android File Transfer.app/Contents/Resources/Android File Transfer Agent.app" "/Applications/Android File Transfer.app/Contents/Resources/Android File Transfer Agent DISABLED.app"
# mv "$HOME/Library/Application Support/Google/Android File Transfer/Android File Transfer Agent.app" "$HOME/Library/Application Support/Google/Android File Transfer/Android File Transfer Agent DISABLED.app"
# osascript -e 'tell application "System Events" to delete every login item whose name is "Android File Transfer Agent"'
