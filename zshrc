zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities id_rsa id_ed25519 id_github_rsa

export CLICOLOR=true

[[ -f ~/.aliases ]] && source ~/.aliases

export ZSH=$HOME/.oh-my-zsh

plugins=(
  git
  dotenv
  osx
  brew
  docker
  docker-compose
  github
  pyenv
  ssh-agent
)

source /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme
