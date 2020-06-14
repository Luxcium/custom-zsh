function fnm_() {
    add_to_path_ "${HOME}/.local/bin"
    eval "$(fnm env --multi)"
}

function rbenv_() {
    add_to_path_ "${HOME}/.rbenv/bin"
    eval "$(rbenv init -)"
}

function nvm_() {
    export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
}

function conda_() {
    load_ "${ZSH_SOURCES}/conda-initialize.zsh" "conda_init"

}
function compute_path() {

    export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"

    add_to_path_ "${TMUX_BIN}"
    add_to_path_ "${ZSH_BIN}"
    add_to_path_ "${HOME}/.yarn/bin:${HOME}/.config/yarn/global/node_modules/.bin"
    add_to_path_ /home/luxcium/.yarn/bin/tsc
    add_to_path_ /home/luxcium/.config/yarn/global/node_modules/.bin/tsc

    add_to_path_ "/home/luxcium/anaconda3/vanadium/bin"
    add_to_path_ "/home/luxcium/anaconda3/vanadium/condabin"
    add_to_path_ "/home/luxcium/bin"
    add_to_path_ "/usr/lib64/qt-3.3/bin"
    add_to_path_ "/usr/lib64/ccache"

    call_ fnm_

    call_ rbenv_

    call_ conda_

    # if [ "$WITH_ANACONDA" = 'true' ]; then
    # fi

    # add_to_path_ "/usr/local/opt/ncurses/bin"
    # add_to_path_ "${HOME}/perl5/bin"
    # add_to_path_ "/usr/local/opt/gettext/bin"
    # add_to_path_ "/usr/local/share/zsh/site-functions"
    # add_to_path_ "/home/luxcium/.nvm/versions/node/v14.4.0/bin"
    echo "PATH=\"$PATH\"" >$HOME/.cache/path.env

    export PATH="::${PATH}::"

}
