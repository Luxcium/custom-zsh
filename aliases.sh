function load_aliases() {

    ######################
    ## POWER LEVEL 10 K ##
    ######################

    ################
    ## AZUR ALIAS ##
    ################
    alias vmdaloc="az vm deallocate -g 'GroupeONE-UKSouth' --name 'MEAN-VirtualONE'"
    alias vmstart="az vm start -g 'GroupeONE-UKSouth' --name 'MEAN-VirtualONE'"

    ################
    ## TMUX ALIAS ##
    ################
    # alias dx='tmux detach'
    alias nx='tmux neww'
    alias dx='tmux detach -a; mxd'
    alias k='_p9k_dump_instant_prompt;notmytty; tmux kill-session -a; killall tmux'
    alias kx='k'
    alias mylab=" tmux new-window -d -c '/Users/neb_401/JupyterLab' -n 'Jupyter Lab' 'env jupyter lab'"
    alias jlab=" tmux new-window -d -n 'Jupyter Lab' 'env jupyter lab'"

    alias n='new'
    alias quit='tmux detach'
    alias q='_p9k_dump_instant_prompt;exit'
    alias alsa="atom ${MY_ALIASES}"
    alias alsc="code ${MY_ALIASES}"
    alias als="load_ ${MY_ALIASES} 'load_aliases'"
    alias alc=alsc
    alias ala=alsa
    alias finder='open .'
    alias allo='echo allo tout le monde'

    alias attach="tmux attach"
    alias bind="tmux bind"
    alias breakp="tmux breakp"
    alias capturep="tmux capturep"
    alias clearhist="tmux clearhist"
    alias confirm="tmux confirm"
    alias deleteb="tmux deleteb"
    alias detach='tmux detach'
    alias display="tmux display"
    alias displayp="tmux displayp"
    alias findw="tmux findw"
    alias has="tmux has"
    alias joinp="tmux joinp"
    alias killp="tmux killp"
    alias killw="tmux killw"
    alias lastp="tmux lastp"
    alias linkw="tmux linkw"
    alias loadb="tmux loadb"
    alias lock="tmux lock"
    alias lockc="tmux lockc"
    alias locks="tmux locks"
    alias lscm="tmux lscm"
    alias lsk="tmux lsk"
    alias lsp="tmux lsp"
    alias lsw="tmux lsw"
    alias menu="tmux menu"
    alias movep="tmux movep"
    alias movew="tmux movew"
    alias neww="tmux neww"
    alias next="tmux next"
    alias nextl="tmux nextl"
    alias pasteb="tmux pasteb"
    alias pipep="tmux pipep"
    alias prev="tmux prev"
    alias prevl="tmux prevl"
    alias refresh="tmux refresh"
    alias rename="tmux rename"
    alias renamew="tmux renamew"
    alias resizep="tmux resizep"
    alias resizew="tmux resizew"
    alias respawnp="tmux respawnp"
    alias respawnw="tmux respawnw"
    alias rotatew="tmux rotatew"
    alias run="tmux run"
    alias saveb="tmux saveb"
    alias selectl="tmux selectl"
    alias selectp="tmux selectp"
    alias selectw="tmux selectw"
    alias send="tmux send"
    alias setb="tmux setb"
    alias setenv="tmux setenv"
    alias show="tmux show"
    alias showb="tmux showb"
    alias showenv="tmux showenv"
    alias showmsgs="tmux showmsgs"
    alias splitw="tmux splitw"
    alias start="tmux start"
    alias suspendc="tmux suspendc"
    alias swapp="tmux swapp"
    alias swapw="tmux swapw"
    alias switchc="tmux switchc"
    alias unbind="tmux unbind"
    alias unlinkw="tmux unlinkw"
    alias list-clients="tmux lsc"   #* was already existing changed to diferent alias
    alias list-sessions="tmux ls"   #* was already existing changed to diferent alias
    alias new-session="tmux new"    #* was already existing changed to diferent alias
    alias source-file="tmux source" #* was already existing changed to diferent alias
    alias lasttx="tmux last"        #* was already existing changed to diferent alias
    alias settx="tmux set"          #* was already existing changed to diferent alias
    alias lsbtx="tmux lsb"          #* was already existing changed to diferent alias
    alias iftx="tmux if"            #* was already existing changed to diferent alias
    alias waittx="tmux wait"        #* was already existing changed to diferent alias
    ####################
    ## Projects ALIAS ##
    ####################
    # PATH_
    # Luxcium.io
    # Questrade-ts
    # Luxcium ZSH
    # VisualStudio Theme
    # NodeJS Repl

    # alias lxXX="cd ${PATH_LXXXY}"

    alias vsx="cd ${PATH_LXIO}; code -n ${PATH_LXIO}"
    alias vx=vsx
    alias vsz="cd ${CUSTOM_ZSH}/..; code -n ${CUSTOM_ZSH}/.."
    alias vz=vsz
    alias vsr="cd ${ZSH_LUXCIUM}/repl/node-repl; code -n ${ZSH_LUXCIUM}/repl/node-repl"
    alias vr=vr
    alias vsqt="cd ${PATH_QUESTRADE}; code -n  ${PATH_QUESTRADE}"
    alias vsq=vsqt
    alias vq=vsq
    alias vqt=vq
    alias vs-iex-cloud="cd ${PATH_IEXCLOUD_API_WRAPPER}; code ${PATH_IEXCLOUD_API_WRAPPER}"
    alias vs-iex-api="cd ${PATH_IEX_API}; code -n ${PATH_IEX_API}"
    alias vstm="cd ${DEV_POPNLOCK}; insiders  -n ${DEV_POPNLOCK}"
    alias vst=vstm
    alias vsram='cd ${PATH_LXIO}/../ramda; code -n ${PATH_LXIO}/../ramda'
    # /Users/neb_401/.oh-my-zsh/custom/luxcium/repl/node-repl

    ## LUXCIUM
    LXI_SESSION='luxcium-io'
    alias lxi="cd ${PATH_LXIO_PRJ}/luxcium.io"
    alias lxicd="lxi; mycode ${PATH_LXIO_PRJ}/luxcium.io"
    alias lximux="tmux-luxcium"
    alias lxicode="lxicd; lximux"
    # alias lxicode="lxcode; tmux new-session -A -s $LXI_SESSION"
    alias lxikill="tmux kill-session -t $LXI_SESSION"

    ## QUESTRADE

    alias runqt='ts-node --pretty "${HOME}/Developer/LuxciumProject/questrade-ts/src/test/playground/debug/debug.ts"'
    alias buildqt='tsc --pretty -p "${HOME}/Developer/LuxciumProject/questrade-ts/configs/tsconfig.commonjs.json"'
    alias wbuildqt='tsc --pretty -w -p "${HOME}/Developer/LuxciumProject/questrade-ts/configs/tsconfig.commonjs.json"'
    alias startqt='node /Users/neb_401/Developer/LuxciumProject/questrade-ts/build/src/test/playground/debug/debug.js'
    alias bstartqt='buildqt && startqt'
    alias bnsqt='bstartqt'
    alias sqt='startqt'
    alias lxq="cd ${PATH_LXIO_PRJ}/questrade-ts"
    alias lxqc="mycode ${PATH_LXIO_PRJ}/questrade-ts && cd ${PATH_LXIO_PRJ}/questrade-ts"
    alias lxqtx="env tmux -uv -f ${TMUX_CONFIGS}/questrade.tmux.conf new-session -A -s questrade-ts -c ${PATH_LXIO_PRJ}/questrade-ts"

    alias qtrun='runqt'
    alias qtbuild='buildqt'
    alias qtwbuild='wbuildqt'
    alias qtstart='startqt'
    alias qtbstart='bstartqt'
    alias qtbns='bnsqt'
    alias qts='sqt'
    # alias tmuxlxic='mycode ${PATH_LXIO_PRJ}/luxcium.io && cd ${PATH_LXIO_PRJ}/luxcium.io'
    # alias lxic='tmuxlxic; tmux new-session -A -s luxcium-io;'
    alias lxcq='lxqc'

    alias txio="env tmux -uv -f ${TMUX_CONFIGS}/luxcium.tmux.conf new-session -A -s luxcium-io -c ${PATH_LXIO_PRJ}/luxcium.io"
    # alias mxdef="tmux -uv -f ${TMUX_CONFIGS}/common.tmux.conf new-session -A -s luxcium-io -c ${PATH_LXIO_PRJ}/luxcium.io"

    alias lux="open $PATH_LXIO_PRJ"
    alias lxz="cd ${CUSTOM_ZSH}/.."
    alias lxzc="mycode ${CUSTOM_ZSH}/.. && cd ${CUSTOM_ZSH}/.."
    alias lx="mycode ${PATH_LXIO_PRJ}/luxcium.io && cd ${PATH_LXIO_PRJ}/luxcium.io"
    alias lxe="cd ${PATH_LXIO_PRJ}/iex-luxcium-api"
    alias lxec="mycode ${PATH_LXIO_PRJ}/iex-luxcium-api && cd ${PATH_LXIO_PRJ}/iex-luxcium-api"
    alias iexc="mycode ${PATH_LXIO_PRJ}/iex-luxcium-api && cd ${PATH_LXIO_PRJ}/iex-luxcium-api"
    alias lxp="cd ${PATH_LXIO_PRJ}/"
    alias lxpc="mycode ${PATH_LXIO_PRJ}/ && cd ${PATH_LXIO_PRJ}/"
    alias lx3="lxqc;lxec;lxic && cd ${PATH_LXIO_PRJ}/"
    alias lx4="cd ~ && atom . ;lxqc;lxec;lxic && cd ${PATH_LXIO_PRJ}/"
    alias lxcode="cd ${PATH_LXIO_PRJ}/ && mycode ./.vscode/luxcium-project.code-workspace"

    #######################
    ## VSCODE ZSH PLUGIN ##
    #######################
    # eslint-config-airbnb-base@latest eslint@latest eslint-config-prettier@latest eslint-plugin-import@latest eslint-plugin-unicorn@latest @typescript-eslint/parser@latest @typescript-eslint/eslint-plugin
    alias newvsportable='bash <(curl -s   https://gist.githubusercontent.com/Luxcium/7357d34622c148f6041842321f315d7a/raw/a758b82e6818b9b9b664b210228ea93f9314c1b4/luxcium-vscode-portable.sh)'
    alias vsportablenew='newvsportable'
    alias portablevsnew='newvsportable'
    alias portablevs='newvsportable'
    # alias ='/Users/neb_401/Developer/VSCode-Instances/clean-16-fev-2020/VisualStudioCode.app'
    # author: https://github.com/MarsiBarsi
    # Use main Visual Studio Code version by default
    : ${VSCODE:=code}

    # alias vsc="$VSCODE ."
    alias vsca="$VSCODE --add"
    alias vscd="$VSCODE --diff"
    alias vscg="$VSCODE --goto"
    alias vscn="$VSCODE --new-window"
    alias vscr="$VSCODE --reuse-window"
    alias vscw="$VSCODE --wait"
    alias vscu="$VSCODE --user-data-dir"

    alias vsced="$VSCODE --extensions-dir"
    alias vscie="$VSCODE --install-extension"
    alias vscue="$VSCODE --uninstall-extension"

    alias vscv="$VSCODE --verbose"
    alias vscl="$VSCODE --log"
    alias vscde="$VSCODE --disable-extensions"

    ##########################
    ## INSIDERS CODE PLUGIN ##
    ##########################
    # author: https://github.com/MarsiBarsi
    # Use INSIDER Visual Studio Code

    : ${ISCODE:=insiders}

    alias ivsc="$ISCODE ."
    alias ivsca="$ISCODE --add"
    alias ivscd="$ISCODE --diff"
    alias ivscg="$ISCODE --goto"
    alias ivscn="$ISCODE --new-window"
    alias ivscr="$ISCODE --reuse-window"
    alias ivscw="$ISCODE --wait"
    alias ivscu="$ISCODE --user-data-dir"

    alias ivsced="$ISCODE --extensions-dir"
    alias ivscie="$ISCODE --install-extension"
    alias ivscue="$ISCODE --uninstall-extension"

    alias ivscv="$ISCODE --verbose"
    alias ivscl="$ISCODE --log"
    alias ivscde="$ISCODE --disable-extensions"

    ##################
    ## GIT / GITHUB ##
    ##################
    alias check='git checkout master'
    alias check-master='git checkout master'
    alias check-luxcium='git checkout luxcium'
    alias push='git push --tags --progress; git push --all --progress; fetch'
    alias gs='git fetch   --auto-gc   -t;git status'
    alias pull='git pull --all -t'
    alias fetch='git fetch -t; git fetch --all -v -u'
    alias lb='git branch -a -v --color | cat'
    alias firstcommit='git add .; git commit -am "Scientia is lux principium✨™"; git push -u origin master'

    alias pullmaster='git checkout master; git pull -S --stat --progress --signoff --tags origin master'

    alias pullnext='hub pull-request && hub merge' #git pull -S --stat --progress --signoff --squash --tags origin next/version'

    alias commitpullnext='git commit -am "merging from origin next/version into local master"; push'

    alias deletenext='git branch -d next/version; git push origin --delete next/version; lb'

    alias newnext='git checkout -b next/version; push; git branch --set-upstream-to=origin/next/version next/version'

    alias gitcleannext='rm -rf ./dist; rm -rf ./build; rm -f ./package.1.json; git add .; git commit -m "getting ready to build next/version"; push'

    alias nextcycle='push; pullmaster; pullnext; commitpullnext; deletenext; newnext; gitcleannext; lb'

    ################
    ## YARN ALIAS ##
    ################
    # npm i concurrently@latest
    # alias yarnu='npm install -g yarn@latest'
    # alias linters='yarn add --dev eslint-config-airbnb-base@latest eslint@latest eslint-config-prettier@latest eslint-plugin-import@latest eslint-plugin-unicorn@latest @typescript-eslint/parser@latest @typescript-eslint/eslint-plugin@latest tslint@latest'
    # alias gnlint='yarn add --glogal --dev eslint-config-airbnb-base@latest eslint@latest eslint-config-prettier@latest eslint-plugin-import@latest eslint-plugin-unicorn@latest @typescript-eslint/parser@latest @typescript-eslint/eslint-plugin@latest tslint@latest typescript@rc ts-node@latest'
    # alias ylint='linters'
    alias yi0='concurrently  "rm yarn.lock" "rm -f package-lock.json" "rm -f pnpm-lock.yaml" "rm -rf node_modules" "npm i -g yarn@latest" > /dev/null;'
    alias yi1='yarn install --force --audit --link-duplicates --check-files;'
    alias yu='fnm install latest-erbium && fnm use latest-erbium && fnm default $(node -v) && fnm install latest && npm i -g concurrently@latest yarn@latest typescript@latest npm@latest ts-node@latest vsce@latest  pnpm@latest  > /dev/null 2>&1 &'
    # alias yi3='yarn add -D typescript@rc @types/node@latest ts-node@latest > /dev/null 2>&1 &'
    alias yi='yi0; yi1; yu' # yi3'

    alias ya='yarn add --exact --audit --force --link-duplicates --check-files --no-progress'
    alias yb='yarn run build --force'
    alias yt='yarn run test'
    ###############
    ## NPM ALIAS ##
    ###############
    alias npmu='npm install -g npm@latest'
    npmglobal='@types/node@latest npm-check-unused@latest npm-check-updates@latest npm-check@latest pnpm@latest prettier@latest ts-node@latest tslib@latest tslint@latest typescript@latest vsce@latest yarn@latest gulp-yaml@latest standard-version@latest bash-language-server@latest eslint@latest eslint-plugin-react@latest eslint-plugin-react@latest @typescript-eslint/parser@latest @typescript-eslint/eslint-plugin@latest eslint@latest prettier@latest eslint-conf-prettier@latest eslint-plugin-prettier@latest @nestjs/cli@latest'
    unnpmglobal='@types/node npm-check npm-check-unused npm-check-updates prettier ts-node tslib tslint typescript vsce yarn gulp-yaml standard-version bash-language-server eslint eslint-plugin-react eslint-plugin-react @typescript-eslint/parser @typescript-eslint/eslint-plugin eslint prettier eslint-conf-prettier eslint-plugin-prettier @nestjs/cli'

    # npm i -g install-peerdeps; npm i -g bash-language-server@latest; npm i -g @types/node@latest; npm i -g eslint@latest; npm i -g gulp-yaml@latest; npm i -g npm-check-unused@latest; npm i -g npm-check-updates@latest; npm i -g npm-check@latest; npm i -g pnpm@latest; npm i -g prettier@latest; npm i -g standard-version@latest; npm i -g tslib@latest; npm i -g tslint@latest; npm i -g typescript@latest; npm i -g vsce@latest; npm i -g yarn@latest; install-peerdeps -g @typescript-eslint/eslint-plugin; install-peerdeps -g @typescript-eslint/parser; install-peerdeps -g eslint-conf-prettier; install-peerdeps -g eslint-plugin-prettier; install-peerdeps -g eslint-plugin-react; install-peerdeps -g ts-node;
    alias NPMupdate="npm -g i npm@latest ${npmglobal}"
    alias PNPMupdate="pnpm -g i ${npmglobal}"
    alias unNPMupdate="npm -g un pnpm ${unnpmglobal}"
    alias unPNPMupdate="pnpm -g un npm ${unnpmglobal} pnpm"
    alias installNPMGlobal='npm i -g npm@latest && npm i -g pnpm@latest && NPMupdate && PNPMupdate'
    alias uninstallNPMGlobal='unPNPMupdate && unNPMupdate'
    alias reinstallNPMGlobal='uninstallNPMGlobal && echo "\n\n==============================\n\n" && installNPMGlobal && pnpm i -g pnpm'
    alias build='yarn run build'
    alias quick='yarn run quick'
    alias tests='yarn run test'
    alias rebuild='yarn run rebuild'
    alias debug='yarn run debug'
    alias nlist='npm list -g --depth 0'
    alias lsg='npm list -g --depth 0'
    alias lg=lsg

    alias jpac='code ./package.json'
    alias tsfig='code ./tsconfig.json'
    alias insdr='/usr/local/bin/insiders'
    alias mycode='code'

    # PYTHONSTARTUP='~/.pythonrc'
    alias py='export PYTHONSTARTUP="$HOME/.pythonrc";clear;python3 -q'

    alias chrome='Google\ Chrome\ Canary --remote-debugging-port=222'
    alias lsc='lc'
    alias new='_p9k_dump_instant_prompt && zsh -i'
    alias newnlni='zsh --no-login --no-interactive'
    alias newninl='newnlni'
    alias newni='zsh --login --no-interactive'
    alias newnl='zsh --no-login --interactive'
    alias newl='zsh --login'
    alias newi='zsh --interactive'

    # alias tmcode='insdr /Users/neb_401/.vscode-insiders/extensions/dev-pop-n-lock-theme-vscode'
    # alias gitAll='/Users/neb_401/gitAll3.sh'
    alias hconf='code ~/.hyper.js'
    alias p9k='compute_p9k'
    alias path='echo ${PATH}'
    alias zshcnf='atom ~/.zshrc'
    alias zshcode='code ~/.oh-my-zsh'
    alias zshatom='atom ~/.oh-my-zsh'
    alias cnftmx='atom ~/.tmux.conf'
    clearall='\u001b[2J\u001b[0;0H'

    alias js="hardcls; env NODE_NO_READLINE=1 rlwrap ${NODELATEST}/node ${NODE_REPL_SCRIPT}"
    # alias zshenv="code ~/.zshenv"

    # alias node="env NODE_NO_READLINE=1 rlwrap node"
    # new-session -A -s luxcium-io
    ## heroku logs -t -a luxcium
    # alias htaillog="curl 'https://www.luxcium.io' &>/dev/null; heroku logs -t -a luxcium"
    # alias xsh="zsh -x"
    # alias zshli="zsh -l -i"
    # alias zshi="zsh -l -i"
    # alias zshl="zsh -l -i"

    # alias zsh0="zsh --mpleteinword"
    # alias zsh1="zsh --printexitvalue"
    # alias zsh2="zsh --no-autoresume"
    # alias zsh3="zsh --no-nomatch"
    # alias zsh4="zsh --globdots"
    # alias zsh5="zsh --notify"
    # alias zsh6="zsh --beep"
    # alias zsh7="zsh --ignoreeof"
    # alias zsh8="zsh --markdirs"
    # alias zsh9="zsh --autocontinue"
    # alias zshB="zsh --no-bashrematch"
    # alias zshC="zsh --no-checkjobs"
    # alias zshD="zsh --pushdtohome"
    # alias zshE="zsh --pushdsilent"
    # alias zshF="zsh --no-glob"
    # alias zshG="zsh --nullglob"
    # alias zshH="zsh --rmstarsilent"
    # alias zshI="zsh --ignorebraces"
    # alias zshJ="zsh --appendhistory"
    # alias zshK="zsh --no-badpattern"
    # alias zshL="zsh --sunkeyboardhack"
    # alias zshM="zsh --singlelinezle"
    # alias zshN="zsh --autoparamslash"
    # alias zshO="zsh --continueonerror"
    # alias zshP="zsh --rcexpandparam"
    # alias zshQ="zsh --pathdirs"
    # alias zshR="zsh --longlistjobs"
    # alias zshS="zsh --recexact"
    # alias zshT="zsh --cbases"
    # alias zshU="zsh --mailwarning"
    # alias zshV="zsh --no-promptcr"
    # alias zshW="zsh --autoremoveslash"
    # alias zshX="zsh --listtypes"
    # alias zshY="zsh --menucomplete"
    # alias zshZ="zsh --zle"
    # alias zsha="zsh --allexport"
    # alias zshd="zsh --no-globalrcs"
    # alias zshe="zsh --errexit"
    # alias zshf="zsh --no-rcs"
    # alias zshg="zsh --histignorespace"
    # alias zshh="zsh --histignoredups"
    # alias zshi="zsh --interactive"
    # alias zshk="zsh --interactivecomments"
    # alias zshl="zsh --login"
    # alias zshm="zsh --monitor"
    # alias zshn="zsh --no-exec"
    # alias zshp="zsh --privileged"
    # alias zshr="zsh --restricted"
    # alias zshs="zsh --shinstdin"
    # alias zsht="zsh --singlecommand"
    # alias zshu="zsh --no-unset"
    # alias zshv="zsh --verbose"
    # alias zshw="zsh --cdablevars"
    # alias zshx="zsh --xtrace"
    # alias zshy="zsh --shwordsplit"

}
