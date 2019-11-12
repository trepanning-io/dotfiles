zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities id_rsa tips-id_rsa

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
  zsh-completions
)

source $ZSH/oh-my-zsh.sh
autoload -U compinit && compinit

source /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme

# set prompt
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status dir vcs)
POWERLEVEL9K_DISABLE_RPROMPT=false
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(kubecontext)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=" "
POWERLEVEL9K_KUBECONTEXT_BACKGROUND="081"
POWERLEVEL9K_KUBECONTEXT_FOREGROUND="000"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="235"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="251"
POWERLEVEL9K_DIR_HOME_BACKGROUND="235"
POWERLEVEL9K_DIR_HOME_FOREGROUND="251"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="235"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="251"

eval "$(pyenv init -)"

export CLICOLOR=true
export EDITOR="code -w -n"
export PATH="/usr/local/sbin:${PATH}:${HOME}/bin:${KREW_ROOT:-$HOME/.krew}/bin"

[[ -f ~/.aliases ]] && source ~/.aliases
export PATH="/usr/local/opt/node@8/bin:$PATH"
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
