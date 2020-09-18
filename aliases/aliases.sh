function projects_paths() {
  ${PATH_LXXXY}
  ${PATH_LXIO}
  ${PATH_QUESTRADE}
  ${PATH_IEXCLOUD_API_WRAPPER}
  ${PATH_IEX_API}
  ${PATH_LXIO_PRJ}
  ${PATH}
  # PATH_
  # alias lxXX="cd ${PATH_LXXXY}"
  alias vsx="cd ${PATH_LXIO}; code -n ${PATH_LXIO}"
  alias vsqt="cd ${PATH_QUESTRADE}; code -n  ${PATH_QUESTRADE}"
  alias vs-iex-cloud="cd ${PATH_IEXCLOUD_API_WRAPPER}; code ${PATH_IEXCLOUD_API_WRAPPER}"
  alias vs-iex-api="cd ${PATH_IEX_API}; code -n ${PATH_IEX_API}"
  alias vsram='cd ${PATH_LXIO}/../ramda; code -n ${PATH_LXIO}/../ramda'
  alias lxi="cd ${PATH_LXIO_PRJ}/luxcium.io"
  alias lxicd=" mycode ${PATH_LXIO_PRJ}/luxcium.io; lxi;"
  alias lxq="cd ${PATH_LXIO_PRJ}/questrade-ts"
  alias lxqc="mycode ${PATH_LXIO_PRJ}/questrade-ts && cd ${PATH_LXIO_PRJ}/questrade-ts"
  alias lxqtx="env tmux -uv -f ${TMUX_CONFIGS}/questrade.tmux.conf new-session -A -s questrade-ts -c ${PATH_LXIO_PRJ}/questrade-ts"
  # alias tmuxlxic='mycode ${PATH_LXIO_PRJ}/luxcium.io && cd ${PATH_LXIO_PRJ}/luxcium.io'
  alias txio="env tmux -uv -f ${TMUX_CONFIGS}/luxcium.tmux.conf new-session -A -s luxcium-io -c ${PATH_LXIO_PRJ}/luxcium.io"
  # alias mxdef="tmux -uv -f ${TMUX_CONFIGS}/common.tmux.conf new-session -A -s luxcium-io -c ${PATH_LXIO_PRJ}/luxcium.io"
  alias lux="open $PATH_LXIO_PRJ"
  alias lx="cd ${PATH_LXIO_PRJ}/luxcium.io && mycode ${PATH_LXIO_PRJ}/luxcium.io"
  alias lxc="mycode ${PATH_LXIO_PRJ}/luxcium.io && cd ${PATH_LXIO_PRJ}/luxcium.io"
  alias lxe="cd ${PATH_LXIO_PRJ}/iex-luxcium-api"
  alias lxec="mycode ${PATH_LXIO_PRJ}/iex-luxcium-api && cd ${PATH_LXIO_PRJ}/iex-luxcium-api"
  alias iexc="mycode ${PATH_LXIO_PRJ}/iex-luxcium-api && cd ${PATH_LXIO_PRJ}/iex-luxcium-api"
  alias lxp="cd ${PATH_LXIO_PRJ}/"
  alias lxpc="mycode ${PATH_LXIO_PRJ}/ && cd ${PATH_LXIO_PRJ}/"
  alias lx3="lxqc;lxec;lxic && cd ${PATH_LXIO_PRJ}/"
  alias lx4="cd ~ && atom . ;lxqc;lxec;lxic && cd ${PATH_LXIO_PRJ}/"
  alias lxcode="cd ${PATH_LXIO_PRJ}/ && mycode ./.vscode/luxcium-project.code-workspace"
  alias path='echo ${PATH}'
  # alias zshQ="zsh --pathdirs"

}

function load_aliases() {

  # TODO Section: Fix thiss mess :
  # personal_projects_paths
  # TODO Section end: Fix thiss mess :

  function mkramdir() {
    # LASTVIRTUALRAM
    if [ -d "${MYVIRTUALRAM_PATH}" ]; then

      LASTVIRTUALRAM="${MYVIRTUALRAM_PATH}/${1}"
      mkdir -p "${LASTVIRTUALRAM}"
      chmod 1777 "${LASTVIRTUALRAM}"
      # cd "${LASTVIRTUALRAM}"
      # ln -s LASTVIRTUALRAM -v
      export LASTVIRTUALRAM

    fi
    # echo "'\$@:' $@, \n'\$1:' $1, \n'\$2:' $2, \n'\$3:' $3, \n'\$4:' $4"

  }

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
  alias ala=alsa
  alias finder='open .'
  alias allo='echo allo tout le monde'
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
  alias lxicd=" mycode ${PATH_LXIO_PRJ}/luxcium.io; lxi;"
  alias lximux="tmux-luxcium"
  # alias lxicode="lxicd; lximux"
  alias lxic="lxicd;" # lximux
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
  alias lx="cd ${PATH_LXIO_PRJ}/luxcium.io && mycode ${PATH_LXIO_PRJ}/luxcium.io"
  alias lxc="mycode ${PATH_LXIO_PRJ}/luxcium.io && cd ${PATH_LXIO_PRJ}/luxcium.io"
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
  alias add='git add -u --renormalize -v .'
  alias addall='git add --all --renormalize -v .'
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
  alias yarn2="yarn set version berry 1>& /dev/null || yarn set version latest; yarn install --immutable --immutable-cache;  yarn stage --commit; git add .yarn* package.json yarn.lock; git commit -m 'yarn update';push"
  alias yi1='concurrently  "rm yarn.lock" "rm -f package-lock.json" "rm -f pnpm-lock.yaml" "rm -rf node_modules"'
  #> /dev/null'
  alias yi2='yarn install --force --audit --link-duplicates --check-files;'
  alias yu='fnm install latest-erbium && \
      fnm install latest && \
     fnm use latest-erbium && \
      fnm default $(node -v)'
  alias yg='yarn global add \
    concurrently@latest yarn@latest typescript@3.9.0-dev.20200324 npm@latest ts-node@latest vsce@latest pnpm@latest  1> /dev/null &'
  # alias yi3='yarn add -D typescript@rc @types/node@latest ts-node@latest > /dev/null 2>&1 &'
  alias yi='yg; yu; yi1 ; yi2' # yi3'

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
  alias lsg='npm list -g --depth 0;yarn global list'
  alias lg=lsg

  alias jpac='code ./package.json'
  alias tsfig='code ./tsconfig.json'
  alias insdr='/usr/local/bin/insiders'
  alias mycode='code'

  # PYTHONSTARTUP='~/.pythonrc'
  alias py='export PYTHONSTARTUP="$HOME/.pythonrc";clear;python3 -q'
  alias a80='echo "1-------10--------20--------30--------40--------50--------60--------70--------80!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"'

  alias a120='echo "1-------10--------20--------30--------40--------50--------60--------70--------80--------90-------100-------110-------120!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"'

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
  alias noderepl="env NODE_NO_READLINE=1 rlwrap node"

}

function parse_options() {
  o_port=(-p 9999)
  o_root=(-r WWW)
  o_log=(-d ZWS.log)
  zparseopts -K -- p:=o_port r:=o_root l:=o_log h=o_help
  if [[ $? != 0 || "$o_help" != "" ]]; then
    echo Usage: $(basename "$0") "[-p PORT] [-r DIRECTORY]"
    exit 1
  fi
  port=$o_port[2]
  root=$o_root[2]
  log=$o_log[2]
  if [[ $root[1] != '/' ]]; then root="$PWD/$root"; fi
}

function ZSH_LOVERS() {

  ########
  ## GNU GPL v2.0
  ## https://github.com/grml/zsh-lovers
  ########

  # from man pages ZSH-LOVERS(1)
  alias ZSH-LOVERS="man ZSH-LOVERS"
  # =============

  # NAME
  # ----
  # zsh-lovers - tips, tricks and examples for the Z shell

  alias -s tex=vim
  alias -s html=w3m
  alias -s org=w3m
  alias -g ...='../..'
  alias -g ....='../../..'
  alias -g .....='../../../..'
  alias -g CA="2>&1 | cat -A"
  alias -g C='| wc -l'
  alias -g D="DISPLAY=:0.0"
  alias -g DN=/dev/null
  alias -g ED="export DISPLAY=:0.0"
  alias -g EG='|& egrep'
  alias -g EH='|& head'
  alias -g EL='|& less'
  alias -g ELS='|& less -S'
  alias -g ETL='|& tail -20'
  alias -g ET='|& tail'
  alias -g F=' | fmt -'
  alias -g G='| egrep'
  alias -g H='| head'
  alias -g HL='|& head -20'
  alias -g Sk="*~(*.bz2|*.gz|*.tgz|*.zip|*.z)"
  alias -g LL="2>&1 | less"
  alias -g L="| less"
  alias -g LS='| less -S'
  alias -g MM='| most'
  alias -g M='| more'
  alias -g NE="2> /dev/null"
  alias -g NS='| sort -n'
  alias -g NUL="> /dev/null 2>&1"
  alias -g PIPE='|'
  alias -g R=' > /c/aaa/tee.txt '
  alias -g RNS='| sort -nr'
  alias -g S='| sort'
  alias -g TL='| tail -20'
  alias -g T='| tail'
  alias -g US='| sort -u'
  alias -g VM=/var/log/messages
  alias -g X0G='| xargs -0 egrep'
  alias -g X0='| xargs -0'
  alias -g XG='| xargs egrep'
  alias -g X='| xargs'

  # EXAMPLES
  # --------
  # Available subsections are *Aliases*, *Completion*, *Unsorted/Misc examples*,
  # *(Recursive) Globbing - Examples*, *Modifiers usage*, *Redirection-Examples*,
  # *ZMV-Examples* and *Module-Examples*.

  # ALIASES
  # ~~~~~~~
  # Suffix aliases are supported in zsh since version 4.2.0. Some examples:
  # -----------------
  # !! alias -s tex=vim
  # !! alias -s html=w3m
  # !! alias -s org=w3m
  # -----------------
  # Now pressing the return-key after entering 'foobar.tex' starts vim with
  # foobar.tex. Calling an html-file runs browser w3m. 'www.zsh.org' and pressing
  # enter starts w3m with argument www.zsh.org. +
  # Global aliases can be used anywhere in the command line. Example:
  # ----------------------
  # $ alias -g C='| wc -l'
  # $ grep alias ~/.zsh/* C
  # 443
  # ----------------------
  # Some more or less useful global aliases (choose whether they are useful or not
  # for you on your own):

  # ----------------------------------------------------------------------------
  # COMPLETION
  # ~~~~~~~~~~
  # See also man 1 zshcompctl zshcompsys zshcompwid. zshcompctl is the old
  # style of zsh programmable completion, zshcompsys is the new completion
  # system, zshcompwid are the zsh completion widgets.

  # Some functions, like _apt and _dpkg, are very slow. You can use a cache
  # in order to proxy the list of  results  (like  the  list  of  available
  # debian packages) Use a cache:
  # ----------------------------------------------------------------------------
  # !! zstyle ':completion:*' use-cache on
  # !! zstyle ':completion:*' cache-path ~/.zsh/cache
  # ----------------------------------------------------------------------------

  # Prevent CVS files/directories from being completed:
  # ----------------------------------------------------------------------------
  # !! zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)CVS'
  # !! zstyle ':completion:*:cd:*' ignored-patterns '(*/)#CVS'
  # ----------------------------------------------------------------------------

  # Fuzzy matching of completions for when you mistype them:
  # ----------------------------------------------------------------------------
  # !! zstyle ':completion:*' completer _complete _match _approximate
  # !! zstyle ':completion:*:match:*' original only
  # !! zstyle ':completion:*:approximate:*' max-errors 1 numeric
  # ----------------------------------------------------------------------------

  # And  if  you  want  the  number  of  errors  allowed by _approximate to
  # increase with the length of what you have typed so far:
  # ----------------------------------------------------------------------------
  # !! # zstyle -e ':completion:*:approximate:*' \
  # 	max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'
  # ----------------------------------------------------------------------------

  # Ignore completion functions for commands you don't have:
  # ----------------------------------------------------------------------------
  # !! zstyle ':completion:*:functions' ignored-patterns '_*'
  # ----------------------------------------------------------------------------

  # With helper functions like:
  # ----------------------------------------------------------------------------
  xdvi() {
    command xdvi ${*:-*.dvi(om[1])}
  }
  # ----------------------------------------------------------------------------

  # you can avoid having to complete at all in many cases, but if  you  do,
  # you  might want to fall into menu selection immediately and to have the
  # words sorted by time:
  # ----------------------------------------------------------------------------
  # !! zstyle ':completion:*:*:xdvi:*' menu yes select
  # !! zstyle ':completion:*:*:xdvi:*' file-sort time
  # ----------------------------------------------------------------------------

  # Completing process IDs with menu selection:
  # ----------------------------------------------------------------------------
  # !! zstyle ':completion:*:*:kill:*' menu yes select
  # !! zstyle ':completion:*:kill:*' force-list always
  # ----------------------------------------------------------------------------

  # If you end up using a directory  as  argument,  this  will  remove  the
  # trailing slash (useful in ln)
  # ----------------------------------------------------------------------------
  # !! zstyle ':completion:*' squeeze-slashes true
  # ----------------------------------------------------------------------------

  # cd will never select the parent directory (e.g.: cd ../<TAB>):
  # ----------------------------------------------------------------------------
  # !! zstyle ':completion:*:cd:*' ignore-parents parent pwd
  # ----------------------------------------------------------------------------

  # Another method for 'quick change directories'.
  # Add this to your ~/.zshrc, then just enter
  # ``cd ..../dir''
  # ----------------------------------------------------------------------------
  rationalise-dot() {
    if [[ $LBUFFER = *.. ]]; then
      LBUFFER+=/..
    else
      LBUFFER+=.
    fi
  }
  # !! zle -N rationalise-dot
  # !! bindkey . rationalise-dot
  # ----------------------------------------------------------------------------
  # !! alias dnf="noglob dnf"

  # COPYRIGHT
  # ---------
  # Copyright (C) Michael Prokop, Christian Schneider and Matthias
  # Kopfermann.

  ########
  ## https://github.com/grml/zsh-lovers
  ## under GNU GPL v2.0
  ########

}

# function _more_aliases() {
#   # echo more_aliases
# }
