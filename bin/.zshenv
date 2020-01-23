#! /usr/bin/env zsh
# echo -n "\u001b[0m\u001b[34m# LOADING... $0 \u001b[31;1m\n"
source "${MY_ALIASES}"
load_layouts
load_aliases
echo "${BEGIN_LOADING} ${0} ${END_LOADING}"
# GITHUB_TOKEN="${MAC_BOOK_PRO_ENV_REPO_GIST_HOOK_NOTIFICATIONS}"
# END in: ~/.zshenv ->
# alias zshenv="code ~/.zshenv"

# echo -n "\u001b[0m\u001b[34m# LOADING... $0 \u001b[31;1m\n"
# echo -n "\u001b[0m\u001b[34m# LOADING... (!!! CUSTOM .zshenv)\u001b[31;1m\n"
export NODE_REPL_HISTORY="$HOME/.node_repl_history"
export NODE_REPL_HISTORY_SIZE=10000
export NODE_NO_READLINE=1
export NODE_REPL_MODE='sloppy'
export GITHUB_USER='Luxcium'
export GITHUB_PASSWORD="${GITHUB_TOKEN}"
# START in: ~/.zshenv -> code ~/.zshenv

export LOCALPORT=80
export PORT=80

export TERM="xterm-256color"
export CLICOLOR='1'
export LSCOLORS='GxFxCxDxBxDgedabagacad'
export GPG_TT=(tty)

export NPM_CHECK_INSTALLER='pnpm'
export NODE_DEPLOYEMENT_ENV='false'
export NODE_ENV='development'
export NODE_LOCAL_ENV='true'
export NODE_REMOTE_ENV='true'
export NODE_TEST_ENV='false'
export SERVER='dev-server'

# source "${ZSH_LUXCIUM}/.source_all.sh"
# source_all # Includes load_paths, load_layouts & load_aliases
