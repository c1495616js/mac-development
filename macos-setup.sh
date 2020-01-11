#!/bin/sh

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install my favourite apps
brew cask install alfred
brew cask install docker
brew cask install google-chrome
brew cask install slack
brew cask install spotify
brew cask install sublime-text
# install other tools
brew install neovim
brew install bash-completion
brew install git
brew install python
brew install python3
brew install go
brew install jq
brew install watch
brew cleanup
# install global dev deps
npm install -g eslint
npm install -g prettier
npm install -g tern
npm install -g neovim

# set up terminal
cp .bash_profile ~/.bash_profile
source ~/.bash_profile

# set up node version manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
source ~/.bash_profile
nvm install node  # install latest version
nvm install --lts # install LTS version

# set up Vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp .vimrc-local ~/.vimrc
brew install cmake
brew install the_silver_searcher
cp .tern-config ~/.tern-config
cp .jsconfig.json ~/.jsconfig.json
vim +PluginInstall +qall
vim +PluginUpdate +qall
vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe && ./install.py --tern-completer

# set up NeoVim
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py

pip2 install neovim --upgrade
pip3 install neovim --upgrade
pip2 install pynvim
pip3 install pynvim

cp .tern-config ~/.tern-config
cp .jsconfig.json ~/.jsconfig.json

mkdir -p ~/.config/nvim/
cp init-local.vim ~/.config/nvim/init.vim

# Install Vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install with Vundle
nvim +PluginInstall +qall
nvim +PluginUpdate +qall
nvim +PluginInstall +qall

# Install with Vim-plug
nvim +PlugInstall +qall

# Set up Typescript server
touch file.ts
nvim file.ts +UpdateRemotePlugins +qall
rm file.ts
