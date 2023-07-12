#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/vivienripoche/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
brew install git wget nvm neovim oh-my-posh
brew install --cask google-chrome iterm2

ssh-keygen -t ed25519 -C "vivienripoche@gmail.com"

sudo mkdir -P /usr/local/bin/
sudo cp ./sc /usr/local/bin/

echo '
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh)"
fi

alias vim="nvim"
alias vi="nvim"

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
' >> ~/.zshrc

source ~/.zshrc

nvm install --lts
nvm use --lts
