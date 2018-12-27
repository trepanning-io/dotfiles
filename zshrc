zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities id_rsa id_ed25519 id_github_rsa

export CLICOLOR=true

[[ -f ~/.aliases ]] && source ~/.aliases

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

ZSH_THEME="agnoster"
