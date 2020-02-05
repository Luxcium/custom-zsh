function pl10k_promt_loader() {
    export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
        # typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
        # os_icon # os identifier
        custom_tsx
        time      # current time
        custom_js #
        battery   # internal battery
        load      # CPU load
        # disk_usage  # disk usage
        # ram         # free RAM
        # ! todo        # !todo items (https://github.com/todotxt/todo.txt-cli)
        # timewarrior # timewarrior tracking status (https://timewarrior.net/)
        status      # exit code of the last command
        newline     # !! ======================[ Line #1 ]======================
        os_icon     # os identifier
        user        #
        dir         # current directory
        newline     # !! ======================[ Line #2 ]======================
        vcs         # git status
        prompt_char # prompt symbol

    )

    export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
        # typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
        # custom_js
        # context # user@hostname
        # custom_js
        # public_ip # public IP address
        # local_ip  # public IP address
        # proxy   # system-wide http/https/ftp proxy
        # example # example user-defined segment (see prompt_example function below)
        # swap        # used swap
        # =========================[ Line #1 ]=========================
        # azure                  # azure account name (https://docs.microsoft.com/en-us/cli/azure)
        # vi_mode                # vi mode (you don't need this if you've enabled prompt_char)
        command_execution_time # duration of the last command
        # direnv                 # direnv status (https://direnv.net/)
        # virtualenv             # python virtual environment (https://docs.python.org/3/library/venv.html)
        custom_npm
        node_version    # node.js version
        newline         # !! =======================[ Line #2 ]=======================
        rbenv           # ruby version from rbenv (https://github.com/rbenv/rbenv)
        anaconda        # conda environment (https://conda.io/)
        background_jobs # presence of background jobs
        # pyenv                  # python environment (https://github.com/pyenv/pyenv)
        # goenv                  # go environment (https://github.com/syndbg/goenv)
        # nodenv                 # node.js version from nodenv (https://github.com/nodenv/nodenv)
        # nvm                    # node.js version from nvm (https://github.com/nvm-sh/nvm)
        # nodeenv                # node.js environment (https://github.com/ekalinin/nodeenv)
        # newline # ! ! =======================[ Line #2 ]=======================
        # go_version             # go version (https://golang.org)
        # rust_version           # rustc version (https://www.rust-lang.org)
        # dotnet_version         # .NET version (https://dotnet.microsoft.com)
        # rvm                # ruby version from rvm (https://rvm.io)
        # fvm                # flutter version management (https://github.com/leoafarias/fvm)
        # luaenv             # lua version from luaenv (https://github.com/cehoffman/luaenv)
        # jenv               # java version from jenv (https://github.com/jenv/jenv)
        # plenv              # perl version from plenv (https://github.com/tokuhirom/plenv)
        # kubecontext        # current kubernetes context (https://kubernetes.io/)
        # terraform          # terraform workspace (https://www.terraform.io)
        # aws                # aws profile (https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html)
        # aws_eb_env         # aws elastic beanstalk environment (https://aws.amazon.com/elasticbeanstalk/)
        # gcloud             # google cloud cli account and project (https://cloud.google.com/)
        # google_app_cred    # google application credentials (https://cloud.google.com/docs/authentication/production)

        # nordvpn            # nordvpn connection status, linux only (https://nordvpn.com/)
        # ranger             # ranger shell (https://github.com/ranger/ranger)
        # nnn                # nnn shell (https://github.com/jarun/nnn)
        # vim_shell          # vim shell indicator (:sh)
        # midnight_commander # midnight commander shell (https://midnight-commander.org/)
        # nix_shell          # nix shell (https://nixos.org/nixos/nix-pills/developing-with-nix-shell.html)
        # vi_mode            # vi mode (you don't need this if you've enabled prompt_char)
        # vpn_ip             # virtual private network indicator

    )

}
function load_pl10K() {

    export TS_ICON=$'\uf071'
    export JS_BG='yellow'
    export JS_FG='black'
    export NODE_BG='green'
    export NODE_FG='black'
    export NPM_BG='green'
    export NPM_FG='black'
    export TS_FG='black'

    export TS_ICON='$TS_ICO'
    export TS_BG='blue'

    export NODE_VERSION="Loading ..."
    export POWERLEVEL9K_CUSTOM_NODE="echo -n '\uf898 ' $NODE_VERSION"

    export NPM_VERSION="Loading ..."
    export POWERLEVEL9K_CUSTOM_NPM="echo -n '\ue71e ' $NPM_VERSION"

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
    export POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

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

    # Load Nerd Fonts with Powerlevel9k theme for Zsh
    export POWERLEVEL9K_MODE='nerdfont-complete'

    pl10k_promt_loader

}

function compute_pl10k() {

    load_pl10K

    export NODE_VERSION="$(cut -d 'v' -f 2 <<<$(node -v))"
    export POWERLEVEL9K_CUSTOM_NODE="echo -n '\uf898 ' $NODE_VERSION"

    export NPM_VERSION="$(npm -v)"
    export POWERLEVEL9K_CUSTOM_NPM="echo -n '\ue71e ' $NPM_VERSION"

}
