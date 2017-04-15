#!/usr/bin/env bash

brew cask install miniconda

# Link miniconda with priority to system python
echo '
# Link system python before miniconda root environment
PATH="$PATH:'$HOME'/miniconda3/bin"' >> ~/.bash_profile

source ~/.bash_profile

# Add conda forge repository
conda config --add channels conda-forge

# Create default python3 general purpose environment
yes | conda create --name conda python=3
source activate conda
yes | conda install scikit-learn pandas nltk spacy flask awscli
source deactivate