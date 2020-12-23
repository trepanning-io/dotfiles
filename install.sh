function install_brew() {
    brew --version || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew install mas
    mas signin --dialog dgethings@me.com
}

function setup_repo() {
    brew install git
    mkdir ${HOME}/git
    cd ${HOME}/git
    git clone --depth 1 https://github.com/trepanning-io/dotfiles.git
}

function install_apps() {
    cd ${HOME}/git/dotfiles
    brew bundle
}

function apply_dotfiles() {
    cd ${HOME}/git/dotfiles
    files="$@"
    for file in "${files[@]}"; do
        echo $file
    done
}

case $OSTYPE in
darwin*)
    install_brew
    setup_repo
    install_apps
    files=(agignore alacritty.yml)
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
