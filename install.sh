function install_brew() {
    brew --version || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew install mas
    mas signin --dialog dgethings@me.com
}

function setup_repo() {
    brew install git
    [ -d ${HOME}/git ] || mkdir ${HOME}/git
    cd ${HOME}/git
    if [ -d dotfiles ]; then
        cd dotfiles
        git pull
    else
        git clone --depth 1 https://github.com/trepanning-io/dotfiles.git
    fi
}

function install_apps() {
    cd ${HOME}/git/dotfiles
    brew bundle
}

function install_omz() {
    cd ${HOME}
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
}

function apply_dotfiles() {
    cd ${HOME}/git/dotfiles
    files="$@"
    for file in "${files[@]}"; do
        ln -s $PWD/$file ${HOME}/.$file
    done
}

case $OSTYPE in
darwin*)
    install_brew
    setup_repo
    install_apps
    install_omz
    files=(agignore alacritty.yml aliases gitconfig gitignore hyper.js p10k.zsh zshenv zshrc)
    apply_dotfiles "${files[@]}"
    # install other things (i.e. helmenv)
    # install versions of langs/apps using *env commands
    ;;
linux)
    echo "using some distro of linux"
    ;;
*)
    echo "The platform is not yet supported"
    exit 1
    ;;
esac
