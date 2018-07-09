#!/usr/bin/env bash

CONDASCRIPT=Miniconda3-latest-MacOSX-x86_64.sh

# Install latest conda using script from offical source
# Because brew cask install miniconda installs to /usr/local/miniconda3
# ruby -e: single command mode
# curl -f: fail silently
# curl -s: silent mode
# curl -S: show errors
# curl -L: follow redirects
# curl -O: write output to a file named as the remote file
curl -fsSLO https://repo.continuum.io/miniconda/$CONDASCRIPT
chmod u+x $CONDASCRIPT
./$CONDASCRIPT
rm $CONDASCRIPT

source ~/.bash_profile

# Add conda forge repository
conda config --add channels conda-forge
