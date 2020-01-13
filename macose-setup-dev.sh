#!/bin/sh

# set up terminal
cp .bash_profile ~/.bash_profile
source ~/.bash_profile

# set up node version manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
source ~/.bash_profile
nvm install node  # install latest version
nvm install --lts # install LTS version

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | zsh
source ~/.bash_profile

# install global dev deps
npm install -g eslint
npm install -g prettier
npm install -g tern
npm install -g neovim

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

# Set up ZSH
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
## font
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
wget -O ~/Downloads/PowerlineSymbols.otf https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
open ~/Downloads/PowerlineSymbols.otf
pip install --user powerline-status
pip install --user git+git://github.com/powerline/powerline
brew tap homebrew/cask-fonts
brew cask install font-hack-nerd-font
brew install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions