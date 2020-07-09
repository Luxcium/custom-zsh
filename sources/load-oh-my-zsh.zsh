function load_oh_my_zsh() {
    # Uncomment the following line to disable bi-weekly auto-update checks.
    DISABLE_AUTO_UPDATE="true"

    # Uncomment the following line to disable auto-setting terminal title.
    DISABLE_AUTO_TITLE="true"

    # Uncomment the following line to enable command auto-correction.
    # ENABLE_CORRECTION="true"

    # Uncomment the following line to display red dots whilst waiting for completion.
    COMPLETION_WAITING_DOTS="true"

    # Uncomment the following line if you want to disable marking untracked files
    # under VCS as dirty. This makes repository status check for large repositories
    # much, much faster.
    DISABLE_UNTRACKED_FILES_DIRTY="true"
    plugins=(
        zsh-autosuggestions
        zsh-syntax-highlighting
        git
        redis-cli
    )
    # alias-finder
    # colorize
    # dnf
    # emoji
    # gem
    # git
    # git-auto-fetch
    # git-hubflow
    # git-prompt
    # github
    # man
    # node
    # npm
    # rbenv
    # redis-cli
    # ruby
    # safe-paste
    # systemadmin
    # systemd
    # tmux
    # tmuxinator
    # vscode
    # yarn
    source $ZSH/oh-my-zsh.sh
    unalias ll
    # echo -n "${normal}$CLRLN$LDLCLR$(tput setaf 2) \uf013 ${bold} DONE! load_oh_my_zsh()${normal}"
}
