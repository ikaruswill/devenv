#!/usr/bin/env bash

CONDASCRIPT=Miniconda3-latest-MacOSX-x86_64.sh

# Install latest conda using script from offical source
# brew cask install miniconda installs to /usr/local/miniconda3
wget https://repo.continuum.io/miniconda/$CONDASCRIPT
chmod u+x $CONDASCRIPT
./$CONDASCRIPT
rm $CONDASCRIPT

# Add conda forge repository
conda config --add channels conda-forge

# Create default python3 general purpose environment
yes | conda create --name conda python=3
source activate conda
yes | conda install scikit-learn pandas nltk spacy flask awscli
source deactivate
