#!/bin/sh

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install my favourite apps
brew cask install alfred
brew cask install docker
brew cask install google-chrome
brew cask install slack
brew cask install postman
brew cask install visual-studio-code
brew cask install iterm2
brew cask install virtualbox virtualbox-extension-pack
brew cask install robo-3t
brew cask install ngrok

# install other tools
brew install zsh
brew install zsh-completions
brew install neovim
brew install bash-completion
brew install git
brew install python
brew install python3
brew install go
brew install jq
brew install mas
brew install wget
brew cleanup

# install from app store
mas install 539883307 # line
mas install 497799835 # Xcode