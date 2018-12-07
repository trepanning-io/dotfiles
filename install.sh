echo "Setting up the Mac..."

if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

mkdir -p /tmp/bootstrap.$$
curl -fsSL https://raw.githubusercontent.com/trepanning-io/dotfiles/master/Brewfile > /tmp/bootstrap.$$/Brewfile
brew bundle --file /tmp/bootstrap.$$/Brewfile
brew bundle cleanup --file /tmp/bootstrap.$$/Brewfile
brew cleanup
rm -rf /tmp/bootstrap.$$
# install key Mac apps: 1Password, Alfred, Omnifocus
# install useful Mac apps: Slack, Trello, Docker, MS Code
# install suplimental MS apps: Teams, Yammer
# Add Mac to my iCloud account
# enable Mac options (i.e. dock location + other prefs)

# chsh -s $(which zsh)

# # symlink zshrc to this repo
# rm -rf $HOME/.zshrc
# ln -s $HOME/.dotfiles/zshrc $HOME/.zshrc

# source .macos