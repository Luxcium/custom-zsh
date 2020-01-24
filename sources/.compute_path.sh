echo "${BEGIN_LOADING} ${0} ${END_LOADING}"
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

# If you need to have gettext first in your PATH run:
#   echo 'export export PATH="/usr/local/opt/gettext/bin:$PATH"' >> ~/.zshrc

function load_paths() {
  if [ "$LOAD_LATER" != 'true' ]; then

    echo "${BEGIN_FUNCTION} 'load_paths()' ${END_FUNCTION}"
    export PATH_COMPLETION="${ZSH_LUXCIUM}/completion"

    export PATH_INSDR_CODE_EXT="${HOME}/.vscode-insiders/extensions"
    export PATH_LXIO_PRJ="${HOME}/Developer/LuxciumProject"

    export PATH_LXIO="${PATH_LXIO_PRJ}/luxcium.io"
    export PATH_OH_MY_ZSH="${ZSH}"
    export PATH_QUESTRADE="${PATH_LXIO_PRJ}/questrade-ts"
    export PATH_IEXCLOUD_API_WRAPPER="${PATH_LXIO_PRJ}/iexcloud-api-wrapper"
    export PATH_IEX_API="${PATH_LXIO_PRJ}/iex-luxcium-api"

    # /Users/neb_401/.vscode-insiders/extensions/dev-pop-n-lock-theme-vscode
    export DEV_POPNLOCK="${PATH_INSDR_CODE_EXT}/dev-pop-n-lock-theme-vscode"

    export PATH_ZSH_FUNCTIONS="${ZSH_LUXCIUM}"
    export PATH_ZSH_FLAGS="${ZSH_LUXCIUM}/flags"
    export ZSH_FLAGS_VALUES="${ZSH_LUXCIUM}/flags/values"

    export PATH_TMUX_CONFIG="${CUSTOM_TMUX}"
    export PATH_TMUX_BIN="${PATH_TMUX_CONFIG}/bin"
    export TMUX_COMMON_CONF="${PATH_TMUX_CONFIG}/common.tmux.config"
    export TMUX_COMMON_THEME="${PATH_TMUX_CONFIG}/theme.tmux.config"
    export PATH_TMUX_MAIN_CONFIG="${HOME}/.tmux.conf"

    export PS2="$(tput setab 7)$(tput setaf 0)  "

    # Ruby
    export WITH_RBENV='true'
    export PATH_RBENV='/Users/neb_401/.rbenv/shims'

    # GEM
    export WITH_BIN_GEM='true'
    export PATH_BIN_GEM='/usr/local/lib/ruby/gems/2.6.0/bin:/usr/local/opt/ruby/bin'

    export PERL5LIB="${HOME}/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"

    export PERL_LOCAL_LIB_ROOT="${HOME}/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
    export PERL_MB_OPT='--install_base "${HOME}/perl5"'
    export PERL_MM_OPT='INSTALL_BASE=/Users/neb_401/perl5'
    export PATH_PKG_CONFIG='/usr/local/opt/sqlite/lib/pkgconfig'
    # export PATH_PKG_CONFIG="/usr/local/opt/openssl/lib/pkgconfig"
    export WITH_ANACONDA='true'
    export PATH_ANACONDA3="$HOME/anaconda3/tungsten/bin"
  fi
}

SHOW_LOAD_CUTLS="true"
function compute_path() {

  export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

  export PATH="$PATH_TMUX_BIN/:${PATH}"

  if [ "$WITH_ANACONDA" = 'true' ]; then
    export PATH="${PATH_ANACONDA3}:${PATH}"
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
  if [ "$ENV_LOADED" != 'true' ]; then
    useful_functions
  fi
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
