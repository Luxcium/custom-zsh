function load_aliases() {
  alias add='git add -u --renormalize -v .'
  alias addall='git add --all --renormalize -v .'
  alias ala=alsa
  alias alc=alsc
  alias allo='echo allo tout le monde'
  alias als="load_ ${MY_ALIASES} 'load_aliases'"
  alias alsa="atom ${MY_ALIASES}"
  alias alsc="code ${MY_ALIASES}"
  alias attach="tmux attach"
  alias bind="tmux bind"
  alias bnsqt='bstartqt'
  alias breakp="tmux breakp"
  alias bstartqt='buildqt && startqt'
  alias build='yarn run build'
  alias buildqt='tsc --pretty -p "${HOME}/Developer/LuxciumProject/questrade-ts/configs/tsconfig.commonjs.json"'
  alias capturep="tmux capturep"
  alias check-luxcium='git checkout luxcium'
  alias check-master='git checkout master'
  alias check='git checkout master'
  alias chrome='Google\ Chrome\ Canary --remote-debugging-port=222'
  alias clearhist="tmux clearhist"
  alias cnftmx='atom ~/.tmux.conf'
  alias commitpullnext='git commit -am "merging from origin next/version into local master"; push'
  alias confirm="tmux confirm"
  alias debug='yarn run debug'
  alias deleteb="tmux deleteb"
  alias deletenext='git branch -d next/version; git push origin --delete next/version; lb'
  alias detach='tmux detach'
  alias display="tmux display"
  alias displayp="tmux displayp"
  alias dx='tmux detach -a; mxd'
  alias fetch='git fetch -t; git fetch --all -v -u'
  alias finder='open .'
  alias findw="tmux findw"
  alias firstcommit='git add .; git commit -am "Scientia is lux principium✨™"; git push -u origin master'
  alias gs='git fetch   --auto-gc   -t;git status'
  alias has="tmux has"
  alias hconf='code ~/.hyper.js'
  alias iexc="mycode ${PATH_LXIO_PRJ}/iex-luxcium-api && cd ${PATH_LXIO_PRJ}/iex-luxcium-api"
  alias iftx="tmux if" #* was already existing changed to diferent alias
  alias insdr='/usr/local/bin/insiders'
  alias installNPMGlobal='npm i -g npm@latest && npm i -g pnpm@latest && NPMupdate && PNPMupdate'
  alias ivsc="$ISCODE ."
  alias ivsca="$ISCODE --add"
  alias ivscd="$ISCODE --diff"
  alias ivscde="$ISCODE --disable-extensions"
  alias ivsced="$ISCODE --extensions-dir"
  alias ivscg="$ISCODE --goto"
  alias ivscie="$ISCODE --install-extension"
  alias ivscl="$ISCODE --log"
  alias ivscn="$ISCODE --new-window"
  alias ivscr="$ISCODE --reuse-window"
  alias ivscu="$ISCODE --user-data-dir"
  alias ivscue="$ISCODE --uninstall-extension"
  alias ivscv="$ISCODE --verbose"
  alias ivscw="$ISCODE --wait"
  alias jlab=" tmux new-window -d -n 'Jupyter Lab' 'env jupyter lab'"
  alias joinp="tmux joinp"
  alias jpac='code ./package.json'
  alias js="hardcls; env NODE_NO_READLINE=1 rlwrap ${NODELATEST}/node ${NODE_REPL_SCRIPT}"
  alias k='_p9k_dump_instant_prompt;notmytty; tmux kill-session -a; killall tmux'
  alias killp="tmux killp"
  alias killw="tmux killw"
  alias kx='k'
  alias lastp="tmux lastp"
  alias lasttx="tmux last" #* was already existing changed to diferent alias
  alias lb='git branch -a -v --color | cat'
  alias lg=lsg
  alias linkw="tmux linkw"
  alias lint:fix='yarn run lint:fix'
  alias lint:pretty='yarn run pretty'
  alias lint='yarn run lint'
  alias list-clients="tmux lsc" #* was already existing changed to diferent alias
  alias list-sessions="tmux ls" #* was already existing changed to diferent alias
  alias loadb="tmux loadb"
  alias lock="tmux lock"
  alias lockc="tmux lockc"
  alias locks="tmux locks"
  alias lsbtx="tmux lsb" #* was already existing changed to diferent alias
  alias lsc='lc'
  alias lscm="tmux lscm"
  alias lsg='npm list -g --depth 0'
  alias lsk="tmux lsk"
  alias lsp="tmux lsp"
  alias lsw="tmux lsw"
  alias lux="open $PATH_LXIO_PRJ"
  alias lx="cd ${PATH_LXIO_PRJ}/luxcium.io && mycode ${PATH_LXIO_PRJ}/luxcium.io"
  alias lx3="lxqc;lxec;lxic && cd ${PATH_LXIO_PRJ}/"
  alias lx4="cd ~ && atom . ;lxqc;lxec;lxic && cd ${PATH_LXIO_PRJ}/"
  alias lxc="mycode ${PATH_LXIO_PRJ}/luxcium.io && cd ${PATH_LXIO_PRJ}/luxcium.io"
  alias lxcode="cd ${PATH_LXIO_PRJ}/ && mycode ./.vscode/luxcium-project.code-workspace"
  alias lxcq='lxqc'
  alias lxe="cd ${PATH_LXIO_PRJ}/iex-luxcium-api"
  alias lxec="mycode ${PATH_LXIO_PRJ}/iex-luxcium-api && cd ${PATH_LXIO_PRJ}/iex-luxcium-api"
  alias lxi="cd ${PATH_LXIO_PRJ}/luxcium.io"
  alias lxic="lxicd;" # lximux
  alias lxicd=" mycode ${PATH_LXIO_PRJ}/luxcium.io; lxi;"
  alias lxicode="lxicd; lximux"
  alias lxikill="tmux kill-session -t $LXI_SESSION"
  alias lximux="tmux-luxcium"
  alias lxp="cd ${PATH_LXIO_PRJ}/"
  alias lxpc="mycode ${PATH_LXIO_PRJ}/ && cd ${PATH_LXIO_PRJ}/"
  alias lxq="cd ${PATH_LXIO_PRJ}/questrade-ts"
  alias lxqc="mycode ${PATH_LXIO_PRJ}/questrade-ts && cd ${PATH_LXIO_PRJ}/questrade-ts"
  alias lxz="cd ${CUSTOM_ZSH}/.."
  alias lxzc="mycode ${CUSTOM_ZSH}/.. && cd ${CUSTOM_ZSH}/.."
  alias menu="tmux menu"
  alias movep="tmux movep"
  alias movew="tmux movew"
  alias mycode='code'
  alias mylab=" tmux new-window -d -c '/Users/neb_401/JupyterLab' -n 'Jupyter Lab' 'env jupyter lab'"
  alias n='new'
  alias new-session="tmux new" #* was already existing changed to diferent alias
  alias new='_p9k_dump_instant_prompt && zsh -i'
  alias newi='zsh --interactive'
  alias newl='zsh --login'
  alias newnext='git checkout -b next/version; push; git branch --set-upstream-to=origin/next/version next/version'
  alias newni='zsh --login --no-interactive'
  alias newninl='newnlni'
  alias newnl='zsh --no-login --interactive'
  alias newnlni='zsh --no-login --no-interactive'
  alias neww="tmux neww"
  alias next="tmux next"
  alias nextcycle='push; pullmaster; pullnext; commitpullnext; deletenext; newnext; gitcleannext; lb'
  alias nextl="tmux nextl"
  alias nlist='npm list -g --depth 0'
  alias node="env NODE_NO_READLINE=1 rlwrap node"
  alias npmu='npm install -g npm@latest'
  alias NPMupdate="npm -g i npm@latest ${npmglobal}"
  alias nx='tmux neww'
  alias p9k='compute_p9k'
  alias pasteb="tmux pasteb"
  alias path='echo ${PATH}'
  alias pipep="tmux pipep"
  alias PNPMupdate="pnpm -g i ${npmglobal}"
  alias portablevs='newvsportable'
  alias portablevsnew='newvsportable'
  alias pretty='yarn run pretty'
  alias prev="tmux prev"
  alias prevl="tmux prevl"
  alias pull='git pull --all -t'
  alias pullmaster='git checkout master; git pull -S --stat --progress --signoff --tags origin master'
  alias push='git push --tags --progress; git push --all --progress; fetch'
  alias py='export PYTHONSTARTUP="$HOME/.pythonrc";clear;python3 -q'
  alias q='_p9k_dump_instant_prompt;exit'
  alias qtbns='bnsqt'
  alias qtbstart='bstartqt'
  alias qtbuild='buildqt'
  alias qtrun='runqt'
  alias qts='sqt'
  alias qtstart='startqt'
  alias qtwbuild='wbuildqt'
  alias quick='yarn run quick'
  alias quit='tmux detach'
  alias rebuild='yarn run rebuild'
  alias refresh="tmux refresh"
  alias rename="tmux rename"
  alias renamew="tmux renamew"
  alias resizep="tmux resizep"
  alias resizew="tmux resizew"
  alias respawnp="tmux respawnp"
  alias respawnw="tmux respawnw"
  alias rotatew="tmux rotatew"
  alias run="tmux run"
  alias runqt='ts-node --pretty "${HOME}/Developer/LuxciumProject/questrade-ts/src/test/playground/debug/debug.ts"'
  alias saveb="tmux saveb"
  alias selectl="tmux selectl"
  alias selectp="tmux selectp"
  alias selectw="tmux selectw"
  alias send="tmux send"
  alias setb="tmux setb"
  alias setenv="tmux setenv"
  alias settx="tmux set" #* was already existing changed to diferent alias
  alias show="tmux show"
  alias showb="tmux showb"
  alias showenv="tmux showenv"
  alias showmsgs="tmux showmsgs"
  alias source-file="tmux source" #* was already existing changed to diferent alias
  alias splitw="tmux splitw"
  alias sqt='startqt'
  alias start="tmux start"
  alias startqt='node /Users/neb_401/Developer/LuxciumProject/questrade-ts/build/src/test/playground/debug/debug.js'
  alias suspendc="tmux suspendc"
  alias swapp="tmux swapp"
  alias swapw="tmux swapw"
  alias switchc="tmux switchc"
  alias tests='yarn run test'
  alias tsfig='code ./tsconfig.json'
  alias unbind="tmux unbind"
  alias uninstallNPMGlobal='unPNPMupdate && unNPMupdate'
  alias unlinkw="tmux unlinkw"
  alias unNPMupdate="npm -g un pnpm ${unnpmglobal}"
  alias unPNPMupdate="pnpm -g un npm ${unnpmglobal} pnpm"
  alias vmdaloc="az vm deallocate -g 'GroupeONE-UKSouth' --name 'MEAN-VirtualONE'"
  alias vmstart="az vm start -g 'GroupeONE-UKSouth' --name 'MEAN-VirtualONE'"
  alias vq=vsq
  alias vqt=vq
  alias vr=vr
  alias vs-iex-api="cd ${PATH_IEX_API}; code -n ${PATH_IEX_API}"
  alias vs-iex-cloud="cd ${PATH_IEXCLOUD_API_WRAPPER}; code ${PATH_IEXCLOUD_API_WRAPPER}"
  alias vsca="$VSCODE --add"
  alias vscd="$VSCODE --diff"
  alias vscde="$VSCODE --disable-extensions"
  alias vsced="$VSCODE --extensions-dir"
  alias vscg="$VSCODE --goto"
  alias vscie="$VSCODE --install-extension"
  alias vscl="$VSCODE --log"
  alias vscn="$VSCODE --new-window"
  alias vscr="$VSCODE --reuse-window"
  alias vscu="$VSCODE --user-data-dir"
  alias vscue="$VSCODE --uninstall-extension"
  alias vscv="$VSCODE --verbose"
  alias vscw="$VSCODE --wait"
  alias vsportablenew='newvsportable'
  alias vsq=vsqt
  alias vsqt="cd ${PATH_QUESTRADE}; code -n  ${PATH_QUESTRADE}"
  alias vsr="cd ${ZSH_LUXCIUM}/repl/node-repl; code -n ${ZSH_LUXCIUM}/repl/node-repl"
  alias vsram='cd ${PATH_LXIO}/../ramda; code -n ${PATH_LXIO}/../ramda'
  alias vst=vstm
  alias vstm="cd ${DEV_POPNLOCK}; insiders  -n ${DEV_POPNLOCK}"
  alias vsx="cd ${PATH_LXIO}; code -n ${PATH_LXIO}"
  alias vsz="cd ${CUSTOM_ZSH}/..; code -n ${CUSTOM_ZSH}/.."
  alias vx=vsx
  alias vz=vsz
  alias waittx="tmux wait" #* was already existing changed to diferent alias
  alias wbuildqt='tsc --pretty -w -p "${HOME}/Developer/LuxciumProject/questrade-ts/configs/tsconfig.commonjs.json"'
  alias ya='yarn add --exact --audit --force --link-duplicates --check-files --no-progress'
  alias yb='yarn run build --force'
  alias yi='yg; yu; yi1 ; yi2' # yi3'
  alias yi1='concurrently  "rm yarn.lock" "rm -f package-lock.json" "rm -f pnpm-lock.yaml" "rm -rf node_modules"'
  alias yi2='yarn install --force --audit --link-duplicates --check-files;'
  alias yt='yarn run test'
  alias zshatom='atom ~/.oh-my-zsh'
  alias zshcnf='atom ~/.zshrc'
  alias zshcode='code ~/.oh-my-zsh'
}
