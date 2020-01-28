function compute_pl10k() {
    export TS_ICON='$TS_ICO'
    export TS_BG='blue'

    export NODE_VERSION="$(cut -d 'v' -f 2 <<<$(node -v))"
    export POWERLEVEL9K_CUSTOM_NODE="echo -n '\uf898 ' $NODE_VERSION"

    export NPM_VERSION="$(npm -v)"
    export POWERLEVEL9K_CUSTOM_NPM="echo -n '\ue71e ' $NPM_VERSION"

    export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
        custom_js
        battery
        custom_node
        custom_npm
        custom_tsx
        newline # !!!
        os_icon
        user
        dir
        newline # !!!
        anaconda
        custom_js
        rbenv
        load
        dir_writable
        ssh
        status
        vcs
        custom_tsx
    )

    export POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR="${LEFT_SEPRATOR}"
    export POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR="${RIGHT_SEPRATOR}"

    export POWERLEVEL9K_CUSTOM_NODE_FOREGROUND='black'
    export POWERLEVEL9K_CUSTOM_NODE_BACKGROUND=$NODE_BG

    export POWERLEVEL9K_CUSTOM_NPMR_FOREGROUND='black'
    export POWERLEVEL9K_CUSTOM_NPMR_BACKGROUND=$NPM_BG

    export POWERLEVEL9K_CUSTOM_NPM_FOREGROUND=$NPM_BG
    export POWERLEVEL9K_CUSTOM_NPM_BACKGROUND='black'

    export POWERLEVEL9K_CUSTOM_TS_FOREGROUND='black'
    export POWERLEVEL9K_CUSTOM_TS_BACKGROUND=$TS_BG

    export POWERLEVEL9K_CUSTOM_TSR_FOREGROUND=$TS_BG
    export POWERLEVEL9K_CUSTOM_TSR_BACKGROUND='black'

    export POWERLEVEL9K_CUSTOM_TSX="echo -n $TS_ICON "
    export POWERLEVEL9K_CUSTOM_TSX_FOREGROUND='black'
    export POWERLEVEL9K_CUSTOM_TSX_BACKGROUND=$TS_BG

    export POWERLEVEL9K_NODE_VERSION_FOREGROUND='black'
    export POWERLEVEL9K_NODE_VERSION_BACKGROUND='green'

}

function load_pl10K() {

    export TS_ICON=$'\uf071'
    export JS_BG='yellow'
    export JS_FG='black'
    export NODE_BG='green'
    export NODE_FG='black'
    export NPM_BG='green'
    export NPM_FG='black'
    export TS_BG='yellow'
    export TS_FG='black'

    export POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
    export POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=4
    export POWERLEVEL9K_CUSTOM_JS="echo -n '\uf81d'"
    export POWERLEVEL9K_CUSTOM_JS_FOREGROUND="$JS_FG"
    export POWERLEVEL9K_CUSTOM_JS_BACKGROUND="$JS_BG"

    export POWERLEVEL9K_RBENV_ALWAYS=true
    export POWERLEVEL9K_RBENV_PROMPT_ALWAYS_SHOW=true
    export POWERLEVEL9K_RBENV_FOREGROUND='red'
    export POWERLEVEL9K_RBENV_BACKGROUND='black'

    export POWERLEVEL9K_COLOR_SCHEME='dark'
    export POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE=false
    export POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE_ALWAYS=false

    export POWERLEVEL9K_TIME_FORMAT='%D{%H:%M:%S}'
    export POWERLEVEL9K_TIME_FOREGROUND='white'
    export POWERLEVEL9K_TIME_BACKGROUND='black'

    export POWERLEVEL9K_RPROMPT_ON_NEWLINE=false
    export POWERLEVEL9K_PROMPT_ON_NEWLINE=false
    export POWERLEVEL9K_PROMPT_ADD_NEWLINE=false

    # os_icon
    export POWERLEVEL9K_OS_ICON_BACKGROUND='blue'
    export POWERLEVEL9K_OS_ICON_FOREGROUND='black'

    # user - Default
    export POWERLEVEL9K_USER_DEFAULT_ICON=$'\uF415'
    export POWERLEVEL9K_USER_DEFAULT_FOREGROUND='008'
    export POWERLEVEL9K_USER_DEFAULT_BACKGROUND='black'
    # user - ROOT
    export POWERLEVEL9K_USER_ROOT_ICON=$'\uf292'
    export POWERLEVEL9K_USER_ROOT_FOREGROUND='red'
    export POWERLEVEL9K_USER_ROOT_BACKGROUND='black'
    # user - SUDO
    export POWERLEVEL9K_USER_SUDO_ICON=$'\uF09C'
    export POWERLEVEL9K_USER_SUDO_FOREGROUND='green'
    export POWERLEVEL9K_USER_SUDO_BACKGROUND='black'
    # Other icons
    export POWERLEVEL9K_DIR_HOME_ICON=$'\uf015'
    export POWERLEVEL9K_DIR_HOME_SUBFOLDER_ICON=$'\uf115'
    export POWERLEVEL9K_DIR_DEFAULT_ICON=$'\uf07c'
    export POWERLEVEL9K_DIR_ETC_ICON=$'\uf085'
    # dir - HOME
    export POWERLEVEL9K_DIR_HOME_BACKGROUND='blue'
    export POWERLEVEL9K_DIR_HOME_FOREGROUND='black'
    # dir - HOME_SUBFOLDER
    export POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='blue'
    export POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='black'
    # dir - DEFAULT
    export POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='blue'
    export POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='black'
    # dir - ETC
    export POWERLEVEL9K_DIR_ETC_BACKGROUND='blue'
    export POWERLEVEL9K_DIR_ETC_FOREGROUND='black'

    # Create prompt section
    export POWERLEVEL9K_CUSTOM_PROMPT='echo -n '.''
    export POWERLEVEL9K_CUSTOM_PROMPT_BACKGROUND='blue'
    export POWERLEVEL9K_CUSTOM_PROMPT_FOREGROUND='black'

    # Normal Disk Usage
    export POWERLEVEL9K_DISK_USAGE_NORMAL_FOREGROUND='blue'
    export POWERLEVEL9K_DISK_USAGE_NORMAL_BACKGROUND='black'

    # Disk Usage: Almost Full
    export POWERLEVEL9K_DISK_USAGE_WARNING_LEVEL='87'
    export POWERLEVEL9K_DISK_USAGE_WARNING_FOREGROUND='red'
    export POWERLEVEL9K_DISK_USAGE_WARNING_BACKGROUND='black'

    # Disk Usage: Critically Full
    export POWERLEVEL9K_DISK_USAGE_CRITICAL_LEVEL='92'
    export POWERLEVEL9K_DISK_USAGE_CRITICAL_FOREGROUND='black'
    export POWERLEVEL9K_DISK_USAGE_CRITICAL_BACKGROUND='red'

    export POWERLEVEL9K_DISK_USAGE_NORMAL_ICON=$'\uf7c9'
    export POWERLEVEL9K_DISK_USAGE_WARNING_ICON=$'\uf7c9'
    export POWERLEVEL9K_DISK_USAGE_CRITICAL_ICON=$'\uf7c9'

    export POWERLEVEL9K_DISK_USAGE_NORMAL_ICON_COLOR='blue'
    export POWERLEVEL9K_DISK_USAGE_WARNING_ICON_COLOR='yellow'
    export POWERLEVEL9K_DISK_USAGE_CRITICAL_ICON_COLOR='black'
    # Time
    export POWERLEVEL9K_TIME_ICON_COLOR='008'
    export POWERLEVEL9K_TIME_FOREGROUND='008'
    export POWERLEVEL9K_TIME_BACKGROUND='black'

    # Customise the Powerlevel9k prompts
    export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
        custom_js
        battery
        custom_tsx
        newline # !!!
        os_icon
        user
        dir
        newline # !!!
        custom_js
        rbenv
        load
        dir_writable
        ssh
        status
        vcs
    )

    export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
        command_execution_time
        ram
        disk_usage
        custom_js
        background_jobs
    )

    # Load Nerd Fonts with Powerlevel9k theme for Zsh
    export POWERLEVEL9K_MODE='nerdfont-complete'
}
