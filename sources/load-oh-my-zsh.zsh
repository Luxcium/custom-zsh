function load_oh_my_zsh() {
    # echo '\u001b[0m\u001b[34m# function load_oh_my_zsh() ...'
    # echo -n "${normal}$CLRLN$LDSCLR$(tput setaf 1) \uf085 ${bold} LOADING!.. load_oh_my_zsh()${normal}"
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
    # DISABLE_UNTRACKED_FILES_DIRTY="true"
    plugins=(
        alias-finder
        brew
        colorize
        git
        rbenv
        tmux
        tmuxinator
        vscode
    )
    source $ZSH/oh-my-zsh.sh
    unalias ll
    # echo -n "${normal}$CLRLN$LDLCLR$(tput setaf 2) \uf013 ${bold} DONE! load_oh_my_zsh()${normal}"
}
