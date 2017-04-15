#!/usr/bin/env bash

# Install App Store Apps
brew install mas
mas signin %EMAIL%
mas upgrade
mas install 937984704 # Amphetamine
mas install 1176895641 # Spark