function load_functions_definitions() {

    function dnfl() {
        sudo dnf list "*${@}*"
    }

    function dnfr() {
        sudo dnf remove "*${@}*"
    }

    function dnfi() {
        sudo dnf install "*${@}*"
    }
    function cdir() {
        mkdir -p -- "$1" &&
            cd -P -- "$1"
    }

    function source_notice_now() {
        source_ "${CUSTOM_ZSH}/notice.sh"
    }

    function update() {
        (update_ >/dev/null)
        (ls node_modules 1>/dev/null 2>&1)
        if [ $? ]; then
            if [ -f yarn.lock ]; then
                S1='package-lock.json'
                [ -f "${S1}" ] && (rm "${S1}" 1>/dev/null 2>&1)

                S1='yarn-error.log'
                [ -f "${S1}" ] && (rm "${S1}" 1>/dev/null 2>&1)

                S1='yarn-error.log'
                [ -f "${S1}" ] && (rm "${S1}" 1>/dev/null 2>&1)

                S1='pnpm-lock.yaml'
                [ -f "${S1}" ] && (rm "${S1}" 1>/dev/null 2>&1)

                S1='node_modules/'
                [ -d "${S1}" ] && (rm -r "${S1}" 1>/dev/null 2>&1)

                (yarn install --force --audit --link-duplicates --check-files)

                [ -f '.yarnclean' ] && (yarn autoclean --force) || (yarn autoclean --init && yarn autoclean --force)

                # yarn add -D eslint@latest typescript@latest ts-node@latest @types/node@latest
                # yarn global add eslint@latest typescript@latest ts-node@latest @types/node@latest
                # install-peerdeps -Y -D @typescript-eslint/eslint-plugin@latest
                # install-peerdeps -Y -D @typescript-eslint/parser@latest
                # install-peerdeps -Y -D eslint-config-airbnb-base@latest
                # install-peerdeps -Y -D eslint-config-airbnb-typescript@latest
                # install-peerdeps -Y -D eslint-config-airbnb@latest
                # install-peerdeps -Y -D eslint-config-prettier@latest
                # install-peerdeps -Y -D eslint-plugin-import@latest
                # install-peerdeps -Y -D eslint-plugin-jsx-a11y@latest
                # install-peerdeps -Y -D eslint-plugin-react-hooks@latest
                # install-peerdeps -Y -D eslint-plugin-react@latest
                # install-peerdeps -Y -D eslint-plugin-node@latest
                # install-peerdeps -Y -D eslint-plugin-unicorn@latest

                #                 warning "eslint-config-airbnb-typescript > eslint-config-airbnb@18.1.0" has unmet peer dependency "eslint-plugin-import@^2.20.1".
                # warning "eslint-config-airbnb-typescript > eslint-config-airbnb@18.1.0" has unmet peer dependency "eslint-plugin-jsx-a11y@^6.2.3".
                # warning "eslint-config-airbnb-typescript > eslint-config-airbnb@18.1.0" has unmet peer dependency "eslint-plugin-react@^7.19.0".
                # warning "eslint-config-airbnb-typescript > eslint-config-airbnb@18.1.0" has unmet peer dependency "eslint-plugin-react-hooks@^2.5.0 || ^1.7.0".
                # warning "eslint-config-airbnb-typescript > eslint-config-airbnb-base@14.1.0" has unmet peer dependency "eslint-plugin-import@^2.20.1".
            fi
        fi
        return 0
    }
    function update_() {
        (fnm-update_ 2>/dev/null)
        (yarn-update_ 2>/dev/null)
        (eslint_global 2>/dev/null)
        (conda-update_ 2>/dev/null)
        return 0
    }

    function cabal-update_() {
        cabal update &
        # conda update --all -y &
        return 0
    }

    function conda-update_() {
        conda update conda -y &
        conda update --all -y &
        return 0
    }

    function fnm-update_() {
        fnm install latest-dubnium &
        fnm install latest-carbon &
        fnm install latest-boron &
        fnm install latest-argon &
        fnm install latest-erbium && fnm use latest-erbium && fnm default $(node -v) && fnm install latest &
        return 0

    }

    function yarn-update_() {
        yarn global add \
            create-react-app@latest \
            eslint-config-prettier@latest \
            eslint@latest \
            prettier@latest \
            install-peerdeps@latest \
            npm@latest \
            pnpm@latest \
            serve@latest \
            shelljs@latest \
            shx@latest \
            ts-node@latest \
            typescript@latest \
            yarn@latest &
        return 0

    }

    function eslint_global() {
        install-peerdeps -Y -g @typescript-eslint/parser@latest
        install-peerdeps -Y -g @typescript-eslint/eslint-plugin@latest
        install-peerdeps -Y -g eslint-config-airbnb-base@latest
        install-peerdeps -Y -g eslint-config-prettier@latest
        install-peerdeps -Y -g eslint-plugin-flowtype@latest
        install-peerdeps -Y -g eslint-plugin-import@latest
        install-peerdeps -Y -g eslint-plugin-jest@latest
        install-peerdeps -Y -g eslint-plugin-jsx-a11y@latest
        install-peerdeps -Y -g eslint-plugin-node@latest
        install-peerdeps -Y -g eslint-plugin-prettier@latest
        install-peerdeps -Y -g eslint-plugin-react-hooks@latest
        install-peerdeps -Y -g eslint-plugin-react@latest
        install-peerdeps -Y -g eslint-plugin-unicorn@latest
        yarn-update_ &
        return 0

    }
    function tsu() {
        yarn add -D yarn@latest &&
            yarn add -D eslint@latest typescript@latest ts-node@latest @types/node@latest &
        yarn global add yarn@latest &&
            yarn global add eslint@latest typescript@latest ts-node@latest @types/node@latest &
    }
    function ts-nightly() {
        yarn add -D typescript@next ts-node@latest @types/node@latest tslib@latest &
        yarn global add typescript@next ts-node@latest @types/node@latest tslib@latest &
    }

    function tmcode() {

        source $TMUX_BIN/tmux-functions.sh
        tmp-set-cache
        TMUX_SESSION="Default"
        TMUX_WINDOW_0="dev-pop-n-lock"
        PATH_TMUX_SESSION="${DEV_POPNLOCK}"
        insdr "${DEV_POPNLOCK}"
        tmux has-session -t $TMUX_SESSION 2>/dev/null
        if [ $? != 0 ]; then
            tmux new -s $TMUX_SESSION -d -n $TMUX_WINDOW_0 -c $PATH_TMUX_SESSION
            tmux-config
        else
            tmux new-window -t $TMUX_SESSION -n $TMUX_WINDOW_0 -c $PATH_TMUX_SESSION
        fi
        tmux-attach
        tmp-reset-to-cache
    }

    function pw() {
        pwd | lolcat
    }

    function lsf() {
        echo ''
        pw
        colorls --almost-all --gs -f
        pw
        echo ''
    }

    function lsd() {
        echo ''
        pw
        colorls --all -d
        pw
        echo ''
    }

    function ll() {
        echo ''
        pw
        colorls -lA --sd --gs
        pw
        echo ''
    }

    function lf() {
        echo ''
        pw
        colorls -lA --sf -f
        pw
        echo ''
    }

    function ld() {
        echo ''
        pw
        colorls -lA --sd -d
        pw
        echo ''
    }

    function lc() {

        colorls -a --sd --gs -S
        pw -ta -d 5
        echo ''
    }

    function cls() {
        print "${clearall}"
        pw

    }

    function cd() {

        builtin cd $@
        echo ''
        pw
        colorls -lA --sd -d
        pw
        echo ''
    }

    # brew configurations

    function perseus() {
        export WITH_ANACONDA=false
        reload_path && echo "The sleeping Medusa decapitated."
    }

    function medusa() {
        export WITH_ANACONDA=true
        reload_path && echo "Perseus turning to stone."
    }

    function brewdoc() {
        # FROM: (SOURCE) https://hashrocket.com/blog/posts/keep-anaconda-from-constricting-your-homebrew-installs
        # (C) 2018 HASHROCKET (used without permision)
        perseus
        command echo '>     UPDATING BREW  . . . '
        command brew update
        command echo '>     UPGRADING BREW  . . . '
        command brew upgrade
        command echo '>     Remove old symlinks  . . . '
        command brew cleanup --prune-prefix
        command echo ">     If nothing is returned to the terminal you're up-to-date  . . . "
        command brew outdated
        command echo '>     List forumlas that can be cleaned up  . . . '
        command brew cleanup -n
        command echo '>     Remove all old formulae from brew and cask  . . . '
        command brew cleanup
        command echo '>     Show the individual packages installed  . . . '
        command brew list
        command echo '>     Looking if everything is working correctly  . . . '
        command brew doctor
        command echo '>     UPGRADING NPM   . . . '
        npm install -g npm@latest
        command echo '>     UPGRADING YARN   . . . '
        npm install -g yarn@latest
        command echo '>     UPGRADING PNPM   . . . '
        npm install -g pnpm@latest
        # command echo '>     Will also uninstall && reinstall all Globals NPM and PNPM  . . . '
        # reinstallNPMGlobal
        medusa

    }

    function brew() {
        perseus
        command brew "$@"
        medusa
    }

    function brewx() {
        command brew "$@"
    }

    function ts-react-app() {
        npx create-react-app $1 --typescript
    }

    function git_add_comit_push() {
        git add .
        git commit -am "${1:=adding functionalities}"
        git push --tags --progress
        git push --all --progress
        git fetch
    }

    function ahmyzsh_git_update() {
        (
            builtin cd $AHMYZSH
            git_add_comit_push "${1}" &
        ) &>/dev/null
        (
            builtin cd $CUSTOM_TMUX
            git_add_comit_push "${1}" &
        ) &>/dev/null
        (
            builtin cd $CUSTOM_ZSH
            git_add_comit_push "${1}" &
        ) &>/dev/null
        (
            builtin cd $NODE_REPL
            git_add_comit_push "${1}" &
        ) &>/dev/null
        (
            builtin cd $POWERLINE
            git_add_comit_push "${1}" &
        ) &>/dev/null
        (
            builtin cd $PYTHON_REPL
            git_add_comit_push "${1}" &
        ) &>/dev/null
        # AHMYZSH="${HOME}/ahmyzsh"
        # CUSTOM_TMUX="${AHMYZSH}/custom-tmux"
        # CUSTOM_ZSH="${AHMYZSH}/custom-zsh"
        # NODE_REPL="${AHMYZSH}/node-repl"
        # OHMYZSH="${AHMYZSH}/ohmyzsh"
        # POWERLEVEL10K="${AHMYZSH}/powerlevel10k"
        # POWERLINE="${AHMYZSH}/powerline"
        # PYTHON_REPL="${AHMYZSH}/python-repl"
    }

    function mytty() {
        tty >~/.tty
        tty >~/.tty1
        tty >~/.tty2
    }

    function mytty0() {
        tty >~/.tty
    }

    function mytty1() {
        tty >~/.tty1
    }

    function mytty2() {
        tty >~/.tty2
    }

    function notmytty() {
        echo -n '' >~/.tty
        echo -n '' >~/.tty1
        echo -n '' >~/.tty2
    }

    function notmytty0() {
        echo -n '' >~/.tty
    }

    function notmytty1() {
        echo -n '' >~/.tty1
    }

    function notmytty2() {
        echo -n '' >~/.tty2
    }

    function cattty() {
        local myTY_=$(cat $HOME/.tty)
        if [ "$myTY_" != "" ]; then
            if [ "${1:-0}" = 1 ]; then
                cattty1 $@
                return 0
            fi
            if [ "${1:-0}" = 2 ]; then
                cattty2 $@
                return 0
            fi
            echo "$(cat $HOME/.tty)"
            return 0
        fi
        return 1
    }

    function cattty1() {
        local myTY_=$(cat $HOME/.tty1)
        if [ "$myTY_" != "" ]; then
            if [ "${1:-0}" = 1 ]; then
                echo -n " 1>$(cat $HOME/.tty1)"
                return 0
            fi
            if [ "${1:-0}" = 2 ]; then
                cattty2 $@
                return 0
            fi
            echo -n " 1>$(cat $HOME/.tty1)"
            # echo "$(cat $HOME/.tty1)"
            return 0
        fi
        return 1
    }

    function cattty2() {
        local myTY_=$(cat $HOME/.tty2)
        if [ "$myTY_" != "" ]; then
            if [ "${1:-0}" = 1 ]; then
                cattty1 $@
                return 0
            fi
            if [ "${1:-0}" = 2 ]; then
                echo -n " 2>$(cat $HOME/.tty2)"
                return 0
            fi
            echo -n " 2>$(cat $HOME/.tty2)"
            # echo "$(cat $HOME/.tty2)"
            return 0
        fi
        return 1
    }

    function toSD1n2() {
        # local myTY_=$(cat $HOME/.tty)
        # if [ "$myTY_" != "" ]; then
        eval $(echo "${@:-echo nothing to do} $(cattty2) $(cattty1)")
        return 0
        # fi
        eval $(echo "${@:-echo nothing to do}")
        return 0

    }

    function toSDOUT1() {
        local myTY_=$(cat $HOME/.tty1)
        if [ "$myTY_" != "" ]; then
            eval $(echo "${@:-echo nothing to do} $(cattty1)")
            return 0
        fi
        eval $(echo "${@:-echo nothing to do}")
    }

    function toSDERR2() {
        local myTY_=$(cat $HOME/.tty2)
        if [ "$myTY_" != "" ]; then
            eval $(echo "${@:-echo nothing to do} $(cattty2)")
            return 0
        fi
        eval $(echo "${@:-echo nothing to do}")
        return 0
    }

    alias to0="toSD1n2"
    alias to1="toSDOUT1"
    alias to2="toSDERR2"

    function ahmyzsh-update() {
        (ahmyzsh-update_ &)
    }

    function ahmyzsh-update_() {

        eval $(echo "(
            toSDERR2 custom-zsh-update
            toSDERR2 custom-tmux-update
            toSDERR2 node-repl-update
            toSDERR2 python-repl-update
            toSDERR2 ohmyzsh-update
            toSDERR2 powerlevel10k-update
            toSDERR2 powerline-update


        )")
        toSD1n2 "custom-update ${AHMYZSH}/"

        return 0
    }

    function custom-update() {
        eval $(echo "(
            builtin cd ${1};
            git add .;
            git commit -am "refresh/update";
            push;
            git checkout ${2:-'master'};
            pull;
            git pull origin ${2:-'master'} -t --ff;
            push;
            git checkout luxcium;
            pull;
            git pull origin ${2:-'master'} -t --ff;
            push;)")
        return 0
    }

    function custom-upstream-update() {
        eval $(echo "(
            builtin cd ${1};
            git add .;
            git commit -am "refresh/update";
            push;
            git checkout ${2:-'master'};
            pull;
            git pull upstream ${2:-'master'} -t --ff;
            push;
            git checkout luxcium;
            pull;
            git pull origin ${2:-'master'} -t --ff;
            push;)")
        return 0
    }

    function ohmyzsh-update() {
        toSDOUT1 "custom-upstream-update ${OHMYZSH}/"
    }

    function powerlevel10k-update() {
        toSDOUT1 "custom-upstream-update ${POWERLEVLE10K}/"
    }

    function powerline-update() {
        toSDOUT1 "custom-upstream-update ${POWERLINE}/ develop"
    }

    function custom-zsh-update() {
        toSDOUT1 "custom-update ${CUSTOM_ZSH}/"
    }

    function node-repl-update() {
        toSDOUT1 "custom-update ${NODE_REP}/"
    }

    function python-repl-update() {
        toSDOUT1 "custom-update ${PYTHON_REPl}/"
    }

    function custom-tmux-update() {
        toSDOUT1 "custom-update ${CUSTOM_TMUX}/"
    }

    # function useful_functions() {

    # Functions ==============================================

    # return 1 if global command line program installed, else 0
    # example
    # echo "node: $(program_is_installed node)"
    function program_is_installed() {
        # set to 1 initially
        local return_=1
        # set to 0 if not found
        type $1 >/dev/null 2>&1 || { local return_=0; }
        # return value
        echo "$return_"
    }

    # return 1 if local npm package is installed at ./node_modules, else 0
    # example
    # echo "gruntacular : $(npm_package_is_installed gruntacular)"
    function npm_package_is_installed() {
        # set to 1 initially
        local return_=1
        # set to 0 if not found
        ls node_modules | grep $1 >/dev/null 2>&1 || { local return_=0; }
        # return value
        echo "$return_"
    }

    # display a message in red with a cross by it
    # example
    # echo echo_fail "No"
    function echo_fail() {
        # echo first argument in red
        printf "\e[31m✘ ${1}"
        # reset colours back to normal
        printf "\033\e[0m"
    }

    # display a message in green with a tick by it
    # example
    # echo echo_fail "Yes"
    function echo_pass() {
        # echo first argument in green
        printf "\e[32m✔ ${1}"
        # reset colours back to normal
        printf "\033\e[0m"
    }

    # echo pass or fail
    # example
    # echo echo_if 1 "Passed"
    # echo echo_if 0 "Failed"
    function echo_if() {
        if [ $1 = 1 ]; then
            echo_pass $2
        else
            echo_fail $2
        fi
    }

    # ============================================== Functions

    # command line programs
    function versions() {
        printf "\033\e[0m"
        env echo "  $(echo_if $(program_is_installed node))  Node $(env node -v)"
        env echo "  $(echo_if $(program_is_installed npm))  NPM v$(env npm -v)"
        env echo "  $(echo_if $(program_is_installed fnm))  FNM v$(env fnm -v)"
        env echo "  $(echo_if $(program_is_installed yarn))  Yarn v$(env yarn -v)"
        env echo "  $(echo_if $(program_is_installed pnpm))  PNPM v$(env pnpm -v)"
        env echo "  $(echo_if $(program_is_installed tmux))  $(env tmux -V)"
        env echo "  $(echo_if $(program_is_installed eslint))  eslint $(env eslint -v)"
        env echo "  $(echo_if $(program_is_installed tsc))  TypeScript $(env tsc -v)"
        env echo "  $(echo_if $(program_is_installed conda))  $(env conda -V)"
        env echo "  $(echo_if $(program_is_installed python))  $(env python -V)"
        env echo "  $(echo_if $(program_is_installed rbenv))  $(env rbenv -v)"
        env echo "  $(echo_if $(program_is_installed gem))  gem v$(env gem -v)"
        env echo "  $(echo_if $(program_is_installed ruby))  $(env ruby -v)"
        # env echo "  $(echo_if $(program_is_installed brew))  $(env command brew -v)"
    }

    # echo "gulp    $(echo_if $(program_is_installed gulp))  "
    # echo "webpack $(echo_if $(program_is_installed webpack))  "
    # echo "conda $(echo_if $(program_is_installed conda))
    # echo "  $(echo_if $(program_is_installed redis))  redis"
    # echo "grep2   $(echo_if $(program_is_installed grep2))"

    # local npm packages
    # echo "lodash  $(echo_if $(npm_package_is_installed lodash))"
    # echo "react   $(echo_if $(npm_package_is_installed react))"
    # echo "angular $(echo_if $(npm_package_is_installed angular))"

    function zsh_version() {
        local ZSH_X=$(echo $0)
        local ZSH_V=$($(echo "${ZSH_X/'-'/}" --version))
        export MY_ZSH_VERSION=" ${TERM_ICO}  ${ZSH_V%%' (x86)'*}"
        echo "${normal}$CLRLN$BYL9K_TERM$(tput setaf 2)${MY_ZSH_VERSION} ${BKBK}${normal}"
    }

    alias reload="source_load_all"
    alias load="source_load_all"
    function source_load_all() {
        toSD1n2 source_load_all_
    }

    function source_load_all_() {
        TIMER_THEN=$(/usr/bin/date +%s%N)

        AHMYZSH="${HOME}/ahmyzsh"

        . "${AHMYZSH}/initial_load.zsh"

        . "${AHMYZSH}/paths.sh"

        . "${CUSTOM_ZSH}/notice.sh"

        init_paths

        source_all_zsh
        load_fab_four

        source_TMUX

        source_path_now
        load_oh_my_zsh_now
        load_autocomplete_now

        load_oh_my_zsh
        compute_path
        # load_autocomplete
        echo "${BEGIN_FUNCTION} $(timer_now) 'source_load_all()' ${END_FUNCTION}"

    }
}

# if [[ ! -o norcs ]]; then
#     echo "... <commands to run if NO_RCS is not set,"
#     echo "                    such as setting options> ..."
# fi
# }
