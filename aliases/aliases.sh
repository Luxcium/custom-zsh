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
  alias clearall='\u001b[2J\u001b[0;0H'

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
