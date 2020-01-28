function compute_path() {
    echo "${BEGIN_LOADING} ${0} ${END_LOADING}"

    export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"

    export PATH="$PATH_TMUX_BIN:${PATH}"

    if [ "$WITH_ANACONDA" = 'true' ]; then
        S1="${ZSH_SOURCES}/conda-initialize.zsh"
        echo "${BEGIN_LOADING} ${S1} ${END_LOADING}"
        . "${S1}"
        conda_init
    fi
    if [ "$WITH_RBENV" = 'true' ]; then
        export PATH="$PATH_RBENV:${PATH}"
    fi
    if [ "$WITH_BIN_GEM" = 'true' ]; then
        export PATH="${PATH_BIN_GEM}:${PATH}"
    fi
    if [ "$WITH_CHROME" = 'true' ]; then
        export PATH="$PATH_CHROME:${PATH}"
    fi

    if [ "$GNU_COREUTILS" = 'true' ]; then
        export PATH="/usr/local/opt/coreutils/libexec/gnubin:${PATH}"
        export PATH="/usr/local/opt/apr-util/bin:${PATH}"
        export PATH="/usr/local/opt/apr/bin:${PATH}"
        export PATH="/usr/local/opt/binutils/bin:${PATH}"
        export PATH="/usr/local/opt/ed/libexec/gnubin:${PATH}"
        export PATH="/usr/local/opt/file-formula/bin:${PATH}"
        export PATH="/usr/local/opt/findutils/libexec/gnubin:${PATH}"
        export PATH="/usr/local/opt/gnu-getopt/bin:${PATH}"
        export PATH="/usr/local/opt/gnu-indent/libexec/gnubin:${PATH}"
        export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:${PATH}"
        export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:${PATH}"
        export PATH="/usr/local/opt/gnu-which/libexec/gnubin:${PATH}"
        export PATH="/usr/local/opt/grep/libexec/gnubin:${PATH}"
        export PATH="/usr/local/opt/m4/bin:${PATH}"
        export PATH="/usr/local/opt/make/libexec/gnubin:${PATH}"
        export PATH="/usr/local/opt/qt/bin:${PATH}"
        export PATH="/usr/local/opt/sqlite/bin:${PATH}"
        export PATH="/usr/local/opt/sqlite/lib/pkgconfig:${PATH}"
        export PATH="/usr/local/opt/unzip/bin:${PATH}"
    fi

    # local HOMEtemp=$HOME
    # local HOME='/Users/neb_401'
    export PATH="${HOME}/.yarn/bin:${HOME}/.config/yarn/global/node_modules/.bin:${PATH}"
    export PATH="${HOME}/perl5/bin:${PATH}"
    export PATH="/opt/X11/bin:${PATH}"
    export PATH="/usr/local/MacGPG2/bin:${PATH}"
    export PATH="/usr/local/share/dotnet:${PATH}"
    export PATH="/usr/local/opt/gettext/bin:$PATH"
    export PATH="${HOME}/.dotnet/tools:${PATH}"
    export PATH="/usr/local/opt/sqlite/bin:${PATH}"
    export PATH="/usr/local/share/zsh/site-functions:${PATH}"

    # export HOME=$HOMEtemp
    eval "$(rbenv init -)"
    # FNM
    eval "$(fnm env --multi)"
    # eval "$(/usr/local/bin/fnm env --multi)"
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
}
