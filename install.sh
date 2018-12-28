echo "Setting up the Mac..."

if test ! $(which brew); then
  xcode-select --install
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

mkdir -p /tmp/bootstrap.$$
cd /tmp/bootstrap.$$
curl -fsSL https://raw.githubusercontent.com/trepanning-io/dotfiles/master/Brewfile > Brewfile
brew bundle 
brew bundle cleanup
brew cleanup
rm -rf /tmp/bootstrap.$$

[[ -f ~/.gitconfig ]] && rm ~/.gitconfig
cp $HOME/git/dotfiles/gitconfig $HOME/.gitconfig
git config --global user.name $(id -F)
git config --global user.email "dgethings@juniper.net"
git config --global credential.helper osxkeychain
ln -s $HOME/git/dotfiles/gitignore $HOME/.gitignore
ln -s $HOME/git/dotfiles/gitmessage $HOME/.gitmessage


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
  if [ "$(uname -s)" == "Darwin" ]; then
    echo "Configuring Mac prefs..."
    ./osx_prefs.sh
  fi
  echo "configuring ZSH..."
  ./shell.sh
)

# source .macos