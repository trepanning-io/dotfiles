echo "Setting up the Mac..."

if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

mkdir -p /tmp/bootstrap.$$
cd /tmp/bootstrap.$$
curl -fsSL https://raw.githubusercontent.com/trepanning-io/dotfiles/master/Brewfile > Brewfile
brew bundle 
brew bundle cleanup 
brew cleanup
rm -rf /tmp/bootstrap.$$

git config --global user.name $(id -F)
git config --global user.email "dgethings@juniper.net"
git config --global credential.helper osxkeychain

if [ ! -d "${HOME}/git" ]; then
  mkdir ~/git
fi

if [ ! -d "${HOME}/git/dotfiles" ]; then
  (
    cd ~/git
    git clone https://github.com/trepanning-io/dotfiles.git
  )
fi

echo "Configuring Mac prefs..."
(
  cd ~/git/dotfiles
  ./osx_prefs.sh
)

# mkdir ~/git || false
# cd ~/git
# if ! -d dotfiles; then
#   git clone https://github.com/trepanning-io/dotfiles.git
# fi
# install useful Mac apps: Slack, Trello, Docker, MS Code
# install suplimental MS apps: Teams, Yammer
# Add Mac to my iCloud account
# enable Mac options (i.e. dock location + other prefs)

# chsh -s $(which zsh)

# # symlink zshrc to this repo
# rm -rf $HOME/.zshrc
# ln -s $HOME/.dotfiles/zshrc $HOME/.zshrc

# source .macos