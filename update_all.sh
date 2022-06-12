#!/bin/sh

# This script updates all system software and installed packages

# update App Store apps
sudo softwareupdate -i -a

# Homebrew
brew update
brew upgrade
brew cleanup

# Pip
python3 -m pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 python3 -m pip install -U

# Ruby gems
gem update --system
gem update --force "$(gem outdated | cut -d ' ' -f 1)";

# NPM

# update dotfiles themselves...
dotfiles pull
