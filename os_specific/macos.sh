#!/bin/sh

# show hidden files in finder by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# save screenshots to the desktop
defaults write com.apple.screencapture location -string "$HOME/Desktop"

# save screenshots in png format
defaults write com.apple.screencapture type -string "png"

#source macosdefaults.sh

# copy pwd to cliptray
alias cpwd="pwd|tr -d '\n'|pbcopy"

# start screensaver
alias screensaver="open /System/Library/CoreServices/ScreenSaverEngine.app"

# empty trash and system logs
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

alias killfinder="killall Finder"
alias killdock="killall Dock"
alias killmenubar="killall SystemUIServer NotificationCenter"
alias killos="killfinder && killdock && killmenubar"
