zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities id_rsa id_ed25519 id_github_rsa

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

source $ZSH/oh-my-zsh.sh

source /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme

eval "$(pyenv init -)"

export CLICOLOR=true
export EDITOR="code -w -n"

[[ -f ~/.aliases ]] && source ~/.aliases
