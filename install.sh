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

(
  cd ~/git/dotfiles
  echo "Configuring Mac prefs..."
  ./osx_prefs.sh
  echo "configuring ZSH..."
  ./shell.sh
)

# source .macos