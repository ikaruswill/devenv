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
