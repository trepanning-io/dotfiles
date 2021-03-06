#!/bin/bash

if [[ $SHELL != "/usr/local/bin/zsh" ]]; then
  echo $(which zsh) | sudo tee -a /etc/shells
  chsh -s $(which zsh)
fi

if [ ! -d ${HOME}/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# symlink zshrc to this repo
rm -rf $HOME/.zshrc || true
ln -s $HOME/git/dotfiles/zshrc $HOME/.zshrc
ln -s $HOME/git/dotfiles/aliases $HOME/.aliases
ln -s $HOME/git/dotfiles/hyper.js $HOME/.hyper.js

# Install Powerline fonts
(
  cd ~/git
  git clone https://github.com/powerline/fonts.git --depth=1
  (
    cd fonts
    ./install.sh
  )
  rm -rf fonts
)