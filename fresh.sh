#!/bin/sh

echo "Setting up your Mac..."

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zprofile
cp .zshrc $HOME/.zprofile

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle --file Brewfile

# nvm install
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

nvm install node
nvm install 18
nvm install 14.17.3
nvm use 14.17.3
npm install -g yarn
npm install -g pm2
sudo env PATH=$PATH:/Users/sam/.nvm/versions/node/v14.17.3/bin /Users/sam/.nvm/versions/node/v14.17.3/lib/node_modules/pm2/bin/pm2 startup launchd -u sam --hp /Users/sam

# bun install 
curl https://bun.sh/install | bash

# Clone Github repositories
# $DOTFILES/clone.sh

# Set macOS preferences - we will run this last because this will reload the shell
source .macos
   