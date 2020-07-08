function fnm_() {
    eval "$(fnm env --multi)"
}

function rbenv_() {
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

    export DOTNET_ROOT="/usr/lib64/dotnet/"

    # - ${PATH}
    export PATH="/sbin"
    add_to_path_ "/usr/sbin"
    add_to_path_ "/usr/local/sbin"

    add_to_path_ "/bin"
    add_to_path_ "/usr/bin"
    add_to_path_ "/usr/local/bin"

    add_to_path_ "/usr/lib64/qt-3.3/bin"
    add_to_path_ "/usr/lib64/ccache"

    add_to_path_ "${HOME}/.config/yarn/global/node_modules/.bin"
    add_to_path_ "${HOME}/.yarn/bin"

    add_to_path_ "${TMUX_BIN}"
    add_to_path_ "${ZSH_BIN}"

    add_to_path_ "${HOME}/.local/bin"
    add_to_path_ "${HOME}/.fnm"
    call_ fnm_

    add_to_path_ "${HOME}/.rbenv/bin"
    call_ rbenv_

    add_to_path_ "${HOME}/anaconda3/vanadium/bin"
    add_to_path_ "${HOME}/anaconda3/vanadium/condabin"
    call_ conda_

    add_to_path_ "${DOTNET_ROOT}"

    add_to_path_ "${HOME}/bin"

    echo "PATH=\"$PATH\"" >${CACHED_PATH}

    export PATH="${AHMYZSH}/bin/plugins:${PATH}:${AHMYZSH}/bin/core"

}
# if [ "$WITH_ANACONDA" = 'true' ]; then
# fi

# add_to_path_ "/usr/local/opt/ncurses/bin"
# add_to_path_ "${HOME}/perl5/bin"
# add_to_path_ "/usr/local/opt/gettext/bin"
# add_to_path_ "/usr/local/share/zsh/site-functions"
# add_to_path_ "/home/luxcium/.nvm/versions/node/v14.4.0/bin"
