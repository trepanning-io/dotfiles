#!/bin/bash

if [$(echo $SHELL) -ne "/usr/local/bin/zsh"]; then
  chsh -s $(which zsh)
fi

if [! -d ${HOME}/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# symlink zshrc to this repo
rm -rf $HOME/.zshrc || true
ln -s $HOME/.dotfiles/zshrc $HOME/.zshrc
