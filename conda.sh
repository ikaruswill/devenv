#!/usr/bin/env bash

brew cask install miniconda

# Link miniconda
echo '# Link system python before miniconda root environment' >> ~/.bash_profile
echo 'PATH="$PATH:'$HOME'/miniconda3/bin"' >> ~/.bash_profile

source ~/.bash_profile

# Add conda forge repository
conda config --add channels conda-forge

# Create default python3 analytics environment
yes | conda create --name conda python=3
source activate conda
conda install scikit-learn
conda install pandas
conda install nltk
conda install spacy
