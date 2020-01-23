echo "${BEGIN_LOADING} ${0} ${END_LOADING}"
# echo -n "\u001b[0m\u001b[34m# LOADING... $0 \u001b[31;1m\n"

################################################################################
##                                                                            ##
##              !!! PLEASE USE CAUTION WHEN USING THIS FILE !!!               ##
##                                                                            ##
##  THIS FILE CANNOT BE USED AS IS YOU MAY HAVE TO CUSTOMISE IT TO USE IT.    ##
##  Even if this file is shared on my public git hub it has not been designed ##
##  for public use. It was not created with the idea that someone else would  ##
##  be using it. The files in this repository have been created for my usage  ##
##  only. They are available so you can see how I have customized my system.  ##
##  I decided to put them in the public space so anyone can download them     ##
##  and edit them. I hope this can inspire someone or serve as a reference.   ##
##                                                                            ##
#+           Copyright (c) 2019-present Benjamin Vincent Kasapoglu            ##
#&                                                                            ##
#&     This Source Code Form is subject to the terms of the Mozilla Public    ##
#&     License, v. 2.0. If a copy of the MPL was not distributed with this    ##
#&           file, You can obtain one at http://mozilla.org/MPL/2.0/.         ##
#&                                                                            ##
##     The above copyright notice and this license notice shall be included   ##
##           in all copies or substantial portions of the Software.           ##
##                                                                            ##
################################################################################

# aliases for zsh
function load_aliases() {
	aliases_functions
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
	alias kx='tmux kill-session -a; killall tmux'
	alias k='tmux kill-session -a; killall tmux'
	alias detach='tmux detach'
	alias mylab=" tmux new-window -d -c '/Users/neb_401/JupyterLab' -n 'Jupyter Lab' 'env jupyter lab'"
	alias jlab=" tmux new-window -d -n 'Jupyter Lab' 'env jupyter lab'"

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
	alias vsz="cd ${ZSH_CUSTOM}; code -n ${ZSH_CUSTOM}"
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
	alias lxqtx="env tmux -uv -f ${PATH_TMUX_CONFIG}/questrade.tmux.conf new-session -A -s questrade-ts -c ${PATH_LXIO_PRJ}/questrade-ts"

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

	alias txio="env tmux -uv -f ${PATH_TMUX_CONFIG}/luxcium.tmux.conf new-session -A -s luxcium-io -c ${PATH_LXIO_PRJ}/luxcium.io"
	# alias mxdef="tmux -uv -f ${PATH_TMUX_CONFIG}/common.tmux.conf new-session -A -s luxcium-io -c ${PATH_LXIO_PRJ}/luxcium.io"

	alias lux="open $PATH_LXIO_PRJ"
	alias lxz="cd ${ZSH_LUXCIUM}"
	alias lxzc="mycode ${ZSH_LUXCIUM} && cd ${ZSH_LUXCIUM}"
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
	# author: https://github.com/MarsiBarsi
	# Use main Visual Studio Code version by default
	: ${VSCODE:=code}

	alias vsc="$VSCODE ."
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
	alias yu='fnm install latest-erbium && fnm install latest && npm i -g concurrently@latest yarn@latest typescript@latest npm@latest ts-node@latest vsce@latest  pnpm@latest  > /dev/null 2>&1 &'
	# alias yi3='yarn add -D typescript@rc @types/node@latest ts-node@latest > /dev/null 2>&1 &'
	alias yi='yi0; yi1; yu' # yi3'

	alias ya='yarn add -E -A --verbose --force'
	alias yb='yarn run build --verbose --force'
	alias yt='yarn run test --verbose'
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
	alias new='zsh -i -l'
	alias new='zsh -i -l'
	alias newnlni='zsh --no-login --no-interactive'
	alias newninl='newnlni'
	alias newni='zsh --login --no-interactive'
	alias newnl='zsh --no-login --interactive'
	alias newl='zsh --login'
	alias newi='zsh --interactive'

	alias n='zsh'
	alias quit='tmux detach'
	alias q='exit'
	alias alsa="atom ${ZSH_LUXCIUM}/.aliases.sh"
	alias alsc="code ${ZSH_LUXCIUM}/.aliases.sh"
	alias als="source ${ZSH_LUXCIUM}/.aliases.sh;load_aliases; echo 'source ${ZSH_LUXCIUM}/.aliases.sh'"
	alias alc=alsc
	alias ala=alsa
	alias finder='open .'
	alias allo='echo allo tout le monde'
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

	export NODE_REPL_SCRIPT="${ZSH_LUXCIUM}/repl/node-repl/repl.js"
	export nodelatest='/Users/neb_401/.fnm/aliases/latest/bin'
	alias js="clear; env NODE_NO_READLINE=1 rlwrap ${nodelatest}/node ${NODE_REPL_SCRIPT}"
	# alias node="env NODE_NO_READLINE=1 rlwrap node"
	# new-session -A -s luxcium-io
	## heroku logs -t -a luxcium
	alias htaillog="curl 'https://www.luxcium.io' &>/dev/null; heroku logs -t -a luxcium"

}

function layouts() {

	export H_SYM="#"
	# echo "${BEGIN_LOADING} ${0} ${END_LOADING}"
	# echo "${BEGIN_FUNCTION} ${0} ${END_FUNCTION}"
	export LD_COLR="\u001b[0m\u001b[34m"
	export LD_ICO_COLR="\u001b[0m\u001b[33m"
	export LD_ICO="${LD_ICO_COLR}${COG_ICO}${LD_COLR}"

	export LD_FN_COLR="${LD_COLR}"
	export LD_FN_ICO_COLR="\u001b[0m\u001b[35;1m"
	export LD_FN_ICO="${LD_FN_ICO_COLR}${FNCT_ICO}${LD_FN_COLR}"
	export BEGIN_LOADING="${LD_COLR} ${H_SYM} ${LD_ICO} LOADING ... >"
	export BEGIN_FUNCTION="${LD_FN_COLR} ${H_SYM} ${LD_FN_ICO} FUNCTION... >"
	export END_LOADING="\u001b[0m\u001b[31;1m${LBOLD}"
	export END_FUNCTION="${END_LOADING}"

}

function load_layouts() {
	export NPM_ICO='\ue71e'
	export NPM_FOLDER_ICO='\ue5fa'
	export LDNCLR="${BBCOLR} $NPM_FOLDER_ICO ${YBCOLR}${normal}"
	export BYL9K_NPM="${BBCOLR} $NPM_ICO ${YBCOLR}${normal}"
	export BYL9K_NPM_FOLDER="${BBCOLR} $NPM_FOLDER_ICO ${YBCOLR}${normal}"

	export GNU_ICO='\ue779'
	export APPLE_ICO='\uf179'
	export TERM_ICO='\uf120'
	export TS_ICO='\ufbe4'
	export JS_ICO='\uf81d'
	export NODE_ICO='\ue718'
	export COG_ICO='\uf013'
	export COG_ICO='\uf013'
	export COGS_ICO='\uf085'
	export COGS_ICO_X=$(echo '\uf085')
	export WARN_ICO='\uf071'
	export FNCT_ICO='\uf794'

	export FNK='\u001b[30m' # Black: \u001b[30m
	export FNR='\u001b[31m' # Red: \u001b[31m
	export FNG='\u001b[32m' # Green: \u001b[32m
	export FNY='\u001b[33m' # Yellow: \u001b[33m
	export FNB='\u001b[34m' # Blue: \u001b[34m
	export FNM='\u001b[35m' # Magenta: \u001b[35m
	export FNC='\u001b[36m' # Cyan: \u001b[36m
	export FNW='\u001b[37m' # White: \u001b[37m

	export FBK='\u001b[30;1m' # Bright Black: \u001b[30;1m
	export FBR='\u001b[31;1m' # Bright Red: \u001b[31;1m
	export FBG='\u001b[32;1m' # Bright Green: \u001b[32;1m
	export FBY='\u001b[33;1m' # Bright Yellow: \u001b[33;1m
	export FBB='\u001b[34;1m' # Bright Blue: \u001b[34;1m
	export FBM='\u001b[35;1m' # Bright Magenta: \u001b[35;1m
	export FBC='\u001b[36;1m' # Bright Cyan: \u001b[36;1m
	export FBW='\u001b[37;1m' # Bright White: \u001b[37;1m

	export BNK='\u001b[40m' # Background Black: \u001b[40m
	export BNR='\u001b[41m' # Background Red: \u001b[41m
	export BNG='\u001b[42m' # Background Green: \u001b[42m
	export BNY='\u001b[43m' # Background Yellow: \u001b[43m
	export BNB='\u001b[44m' # Background Blue: \u001b[44m
	export BNM='\u001b[45m' # Background Magenta: \u001b[45m
	export BNC='\u001b[46m' # Background Cyan: \u001b[46m
	export BNW='\u001b[47m' # Background White: \u001b[47m

	export BBK='\u001b[40;1m' # Background Bright Black: \u001b[40;1m
	export BBR='\u001b[41;1m' # Background Bright Red: \u001b[41;1m
	export BBG='\u001b[42;1m' # Background Bright Green: \u001b[42;1m
	export BBY='\u001b[43;1m' # Background Bright Yellow: \u001b[43;1m
	export BBB='\u001b[44;1m' # Background Bright Blue: \u001b[44;1m
	export BBM='\u001b[45;1m' # Background Bright Magenta: \u001b[45;1m
	export BBC='\u001b[46;1m' # Background Bright Cyan: \u001b[46;1m
	export BBW='\u001b[47;1m' # Background Bright White: \u001b[47;1m

	export LBOLD='\u001b[1m' # Bold: \u001b[1m
	export LUND='\u001b[4m'  # Underline: \u001b[4m
	export LREV='\u001b[7m'  # Reversed: \u001b[7m

	export LUP_A='\u001b['    # Up: \u001b[{n}A moves cursor up by n
	export LDOWN_B='\u001b['  # Down: \u001b[{n}B moves cursor down by n
	export LRIGHT_C='\u001b[' # Right: \u001b[{n}C moves cursor right by n
	export LLEFT_D='\u001b['  # Left: \u001b[{n}D moves cursor left by n

	export LNX_E='\u001b['    # Next Line: \u001b[{n}E moves cursor to beginning of line n lines down
	export LPV_F='\u001b['    # Prev Line: \u001b[{n}F moves cursor to beginning of line n lines down
	export LCOL_G='\u001b['   # Set Column: \u001b[{n}G moves cursor to column n
	export LPOSRC_H='\u001b[' # Set Position: \u001b[{n};{m}H moves cursor to row n column m

	export LCS0='\u001b[0J' # Clear Screen: \u001b[{n}J n=0 clears from cursor until end of screen,
	export LCS1='\u001b[1J' # Clear Screen: \u001b[{n}J n=1 clears from cursor to beginning of screen
	export LCS2='\u001b[2J' # Clear Screen: \u001b[{n}J n=2 clears entire screen

	export LCL0='\u001b[0K' # Clear Line: \u001b[{n}K n=0 clears from cursor to end of line
	export LCL1='\u001b[1K' # Clear Line: \u001b[{n}K n=1 clears from cursor to start of line
	export LCL2='\u001b[2K' # Clear Line: \u001b[{n}K n=2 clears entire line

	export SPS='\u001b[s' # Save Position: \u001b[{s} saves the current cursor position
	export RPS='\u001b[u' # Save Position: \u001b[{u} restores the cursor to the last saved position

	export RSET='\u001b[0m'

	export bold="$LBOLD"
	export normal="$RSET"
	export PZTX='\u001b[1;0H'
	export PZT='\u001b[2;0H'
	export PZTED='\u001b[0;50H'
	export CLRZ='\u001b[2J'
	export DW="${LDOWN_B}1B"
	export UPW="${LUP_A}1A"
	export CLRLN='\u001b[2K \u001b[0G'
	export RWT='\u001b[54C'
	export RWTT='\u001b[10C'
	export BKBG='\u001b[40m'
	export BKFG='\u001b[30m'
	export YKBG='\u001b[43m'
	export YKFG='\u001b[33m'

	export YBCOLR="$BKBG$YKFG"
	export BBCOLR="$BKFG$YKBG"
	export BKBK="$BKBG$BKFG"
	export RVSD='\u001b[7m'

	export ELCLR="${BBCOLR} $TERM_ICO ${YBCOLR}${normal}"
	export SLCLR="${BBCOLR} $TERM_ICO ${YBCOLR}${normal}"
	export LDSCLR="${BBCOLR} $COGS_ICO ${YBCOLR}${normal}"
	export LDLCLR="${BBCOLR} $COG_ICO ${YBCOLR}${normal}"

	export BYL9K_GNU="${BBCOLR} $GNU_ICO ${YBCOLR}${normal}"
	export BYL9K_APPLE="${BBCOLR} $APPLE_ICO ${YBCOLR}${normal}"
	export BYL9K_TERM="${BBCOLR} $TERM_ICO ${YBCOLR}${normal}"
	export BYL9K_TS="${BBCOLR} $TS_ICO ${YBCOLR}${normal}"
	export BYL9K_JS="${BBCOLR} $JS_ICO ${YBCOLR}${normal}"
	export BYL9K_NODE="${BBCOLR} $NODE_ICO ${YBCOLR}${normal}"
	export BYL9K_COG="${BBCOLR} $COG_ICO ${YBCOLR}${normal}"
	export BYL9K_COGS="${BBCOLR} $COGS_ICO ${YBCOLR}${normal}"
	export BYL9K_COGS="${BBCOLR} $COGS_ICO ${YBCOLR}${normal}"
	export BYL9K_COGS="$BNY$FNK $COGS_ICO $BNK$FNY${normal}"
	export BRL9K_COGS="$BNR$FNK $COGS_ICO $BNK$FNR${normal}"
	export BGL9K_COGS="$BNG$FNK $COGS_ICO $BNK$FNG${normal}"
	layouts
}

function tmcode() {
	source $PATH_TMUX_BIN/tmux-functions.sh
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

function useful_functions() {

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
		if [ $1 == 1 ]; then
			echo_pass $2
		else
			echo_fail $2
		fi
	}

	# ============================================== Functions

	# command line programs
	echo "node    $(echo_if $(program_is_installed node))"
	echo "gulp    $(echo_if $(program_is_installed gulp))"
	echo "webpack $(echo_if $(program_is_installed webpack))"
	echo "eslint  $(echo_if $(program_is_installed eslint))"
	echo "tsc     $(echo_if $(program_is_installed tsc))"
	echo "brew    $(echo_if $(program_is_installed brew))"
	echo "gem     $(echo_if $(program_is_installed gem))"

	# local npm packages
	echo "lodash  $(echo_if $(npm_package_is_installed lodash))"
	echo "react   $(echo_if $(npm_package_is_installed react))"
	echo "angular $(echo_if $(npm_package_is_installed angular))"

}

function aliases_functions() {

	function lsf() {
		echo ''
		pwd | lolcat
		colorls --almost-all --gs -f
		pwd | lolcat
		echo ''
	}

	function lsd() {
		echo ''
		pwd | lolcat
		colorls --all -d
		pwd | lolcat
		echo ''
	}

	function ll() {
		echo ''
		pwd | lolcat
		colorls -lA --sd --gs
		pwd | lolcat
		echo ''
	}

	function lf() {
		echo ''
		pwd | lolcat
		colorls -lA --sf -f
		pwd | lolcat
		echo ''
	}

	function ld() {
		echo ''
		pwd | lolcat
		colorls -lA --sd -d
		pwd | lolcat
		echo ''
	}

	function lc() {

		colorls -a --sd --gs -S
		pwd | lolcat -ta -d 5
		echo ''
	}

	function cls() {
		print "${clearall}"
		pwd | lolcat

	}

	function hardcls() {
		echo '\u001b[2J'
		echo '\u001b[0;0H'
	}

	function cd() {

		builtin cd $@
		echo ''
		pwd | lolcat
		colorls -lA --sd -d
		pwd | lolcat
		echo ''
	}

	# brew configurations

	# function perseus() {
	#     export WITH_ANACONDA=false
	#     compute_path && echo "The sleeping Medusa decapitated."
	# }

	# function medusa() {
	#     export WITH_ANACONDA=true
	#     echo "Perseus  turning  to stone."
	#     compute_path
	# }

	function brewdoc() {
		# FROM: (SOURCE) https://hashrocket.com/blog/posts/keep-anaconda-from-constricting-your-homebrew-installs
		# (C) 2018 HASHROCKET (used without permision)
		# perseus
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
		# command echo '>     Will also uninstall && reinstall all Globals NPM and PNPM  . . . '
		# reinstallNPMGlobal
		# medusa
	}

	function brew() {
		# perseus
		command brew "$@"
		# medusa
	}

	function brewx() {
		command brew "$@"
	}

	function ts-react-app() {
		npx create-react-app $1 --typescript
	}

}
##!!0###########################################################################
##!!                                                                          ##
#+!!         Copyright (c) 2019-present Benjamin Vincent Kasapoglu            ##
#&!!                                                                          ##
#&!!   This Source Code Form is subject to the terms of the Mozilla Public    ##
#&!!   License, v. 2.0. If a copy of the MPL was not distributed with this    ##
#&!!         file, You can obtain one at http://mozilla.org/MPL/2.0/.         ##
#&!!                                                                          ##
##!!   The above copyright notice and this license notice shall be included   ##
##!!         in all copies or substantial portions of the Software.           ##
##!!                                                                          ##
##!!          ------------------------------------------------------          ##
##!!                                                                          ##
##!!    Disclaimer of Warranty                                                ##
##!!   -------------------------                                              ##
##!!                                                                          ##
##!!   Covered Software is provided under this License on an "as is"          ##
##!!   basis, without warranty of any kind, either expressed, implied, or     ##
##!!   statutory, including, without limitation, warranties that the          ##
##!!   Covered Software is free of defects, merchantable, fit for a           ##
##!!   particular purpose or non-infringing. The entire risk as to the        ##
##!!   quality and performance of the Covered Software is with You.           ##
##!!   Should any Covered Software prove defective in any respect, You        ##
##!!   (not any Contributor) assume the cost of any necessary servicing,      ##
##!!   repair, or correction. This disclaimer of warranty constitutes an      ##
##!!   essential part of this License. No use of any Covered Software is      ##
##!!   authorized under this License except under this disclaimer.            ##
##!!                                                                          ##
##!!0###########################################################################
