function fnm_() {
    eval "$(fnm env --multi)"
}

function rbenv_() {
    eval "$(rbenv init -)"
}

function compute_path() {
    export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"
    add_to_path_ "${TMUX_BIN}"
    add_to_path_ "${ZSH_BIN}"
    # /bin
    # FNM
    call_ fnm_

    #  HOME=$HOMEtemp
    call_ rbenv_

    if [ "$WITH_ANACONDA" = 'true' ]; then
        load_ "${ZSH_SOURCES}/conda-initialize.zsh" "conda_init"
    fi

    if [ "$GNU_COREUTILS" = 'true' ]; then
        add_to_path_ "/usr/local/opt/coreutils/libexec/gnubin"
        add_to_path_ "/usr/local/opt/apr-util/bin"
        add_to_path_ "/usr/local/opt/apr/bin"
        add_to_path_ "/usr/local/opt/binutils/bin"
        add_to_path_ "/usr/local/opt/ed/libexec/gnubin"
        add_to_path_ "/usr/local/opt/file-formula/bin"
        add_to_path_ "/usr/local/opt/findutils/libexec/gnubin"
        add_to_path_ "/usr/local/opt/gnu-getopt/bin"
        add_to_path_ "/usr/local/opt/gnu-indent/libexec/gnubin"
        add_to_path_ "/usr/local/opt/gnu-sed/libexec/gnubin"
        add_to_path_ "/usr/local/opt/gnu-tar/libexec/gnubin"
        add_to_path_ "/usr/local/opt/gnu-which/libexec/gnubin"
        add_to_path_ "/usr/local/opt/grep/libexec/gnubin"
        add_to_path_ "/usr/local/opt/m4/bin"
        add_to_path_ "/usr/local/opt/make/libexec/gnubin"
        add_to_path_ "/usr/local/opt/qt/bin"
        add_to_path_ "/usr/local/opt/sqlite/bin"
        add_to_path_ "/usr/local/opt/sqlite/lib/pkgconfig"
        add_to_path_ "/usr/local/opt/unzip/bin"
    fi

    add_to_path_ "/usr/local/opt/ncurses/bin"
    add_to_path_ "${HOME}/.yarn/bin:${HOME}/.config/yarn/global/node_modules/.bin"
    add_to_path_ "${HOME}/perl5/bin"
    add_to_path_ "/opt/X11/bin"
    add_to_path_ "/usr/local/MacGPG2/bin"
    add_to_path_ "/usr/local/share/dotnet"
    add_to_path_ "/usr/local/opt/gettext/bin"
    add_to_path_ "${HOME}/.dotnet/tools"
    add_to_path_ "/usr/local/share/zsh/site-functions"

    call_ eval $(docker-machine env default)

    echo "PATH=\"$PATH\"" >$HOME/.cache/path.env

    export PATH

}

function gnu_coreutils() {
    if [ "$SHOW_LOAD_CUTLS" = 'true' ]; then
        if [ "$GNU_COREUTILS" != 'true' ]; then
            echo -n "${normal}${CLRLN}${BYL9K_GNU}$(tput setaf 2) ${COG_ICO} ${bold} $(tput setaf 2)GNU/Linux utils$(tput setaf 1) NOT in function${BKBK}${normal}\n"
        fi
        if [ "$GNU_COREUTILS" = 'true' ]; then
            echo -n "${normal}${CLRLN}${BYL9K_GNU}$(tput setaf 2) ${COG_ICO} ${bold} $(tput setaf 2)GNU/Linux utils$(tput setaf 2) are in function${BKBK}${normal}\n"
        fi
        SHOW_LOAD_CUTLS="false"
    fi
}
