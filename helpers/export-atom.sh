echo "Export atom environment"

pushd ../ > /dev/null

echo "Exporting atom packages..."
apm list --installed --bare > package-list.txt

echo "Exporting atom settings..."
cp $HOME/.atom/config.cson .

popd > /dev/null
echo "Done"
