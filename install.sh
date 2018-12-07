echo "Setting up the Mac..."

if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install ansible
brew update
brew install ansible
ansible-galaxy install geerlingguy.homebrew
mkdir /tmp/bootstrap.$$
cd /tmp/bootstrap.$$
curl -fsSL https://raw.githubusercontent.com/trepanning-io/dotfiles/master/setup_mac.yaml > setup_mac.yaml
ansible-playbook setup_mac.yaml

# clean up
cd ~
rm -rf /tmp/bootstrap.$$
ansible-galaxy uninstall geerlingguy.homebrew
brew uninstall ansible
brew cleanup
# setup so playbook/roles are available and can be run
# install key Mac apps: 1Password, Alfred, Omnifocus
# install useful Mac apps: Slack, Trello, Docker, MS Code
# install suplimental MS apps: Teams, Yammer
# Add Mac to my iCloud account
# enable Mac options (i.e. dock location + other prefs)

# brew tap homebrew/bundle
# brew bundle

# chsh -s $(which zsh)

# # symlink zshrc to this repo
# rm -rf $HOME/.zshrc
# ln -s $HOME/.dotfiles/zshrc $HOME/.zshrc

# source .macos