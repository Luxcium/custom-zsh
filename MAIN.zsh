function activate_normal_prompt() {

  typeset -g ZSH_THEME="../../powerlevel10k/powerlevel10k"
  source_ "${POWERLEVEL10K}/powerlevel10k.zsh-theme"

}

function activate_instant_prompt() {
  # # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
  # # Initialization code that may require console input (password prompts, [y/n]
  # # confirmations, etc.) must go above this block, everything else may go below.

  typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
  typeset -g ZSH_THEME="../../powerlevel10k/powerlevel10k"

  source_ "${CUSTOM_ZSH}/sources/instant-prompt"
  source_ "${POWERLEVEL10K}/powerlevel10k.zsh-theme"

}

function load_my_powerlevel10k_now() {
  ## load_my_pl10K_layout_now
  source_ "${CUSTOM_ZSH}/sources/pl10K-Layout.zsh"
  load_my_powerlevel10k
  pl10k_prompt_on

}

function compute_pl10K_now() {
  call_ "compute_pl10k"
}

function load_path() {
  ## load_flags_now
  load_ "${ZSH_FLAGS}/flg-shortcuts.sh" "init_flags"
  ## source_ path.zsh
  source_ "${ZSH_COMPUTE}/path.zsh"
  ## load_path
  if [ -f "${CACHED_PATH}" ]; then
    source_ "${CACHED_PATH}"
    (compute_path &) >/dev/null
  else
    compute_path
  fi
}

function re_load_path() {
  load_ "${ZSH_FLAGS}/flg-shortcuts.sh" "init_flags"
  source_ "${ZSH_COMPUTE}/path.zsh"
  compute_path
}

function source_powerline_now() {
  source_ "${POWERLINE_BINDINGS}/zsh/powerline.zsh"
  return 0
}

function source_tmux() {
  source_ "${TMUX_FUNCTIONS}/index.sh"
  source_ "${TMUX_BIN}/tmux-loader.sh"
  load_tmux
  source_powerline_now
}

function source_saybye_now() {
  source_ "${ZSH_SOURCES}/say-bye.zsh"
}

function load_zlogout() {
  ##$  Interactive,login

  ( 
    (builtin cd $AHMYZSH &&
      find $(pwd) | grep .zwc | foreachline rm -f &&
      zsh_compile_all_R) &
  )                                           # 1.2385s
  ( (_p9k_dump_instant_prompt 2>/dev/null) &) # 0.0310s
  ( (compute_path 2>/dev/null) &)             # 0.4123s

  echo -en "\u001b[1A"
  echo -en "\e[38;2;252;198;36m                                    \u001b[1000D"
  sleep 0.085
  echo -en "\e[38;2;252;198;36m          B                         \u001b[1000D"
  sleep 0.085
  echo -en "\e[38;2;252;198;36m         BY                         \u001b[1000D"
  sleep 0.085
  echo -en "\e[38;2;252;198;36m        BYE                         \u001b[1000D"
  sleep 0.085
  echo -en "\e[38;2;252;198;36m       BYE                          \u001b[1000D"
  sleep 0.085
  echo -en "\e[38;2;252;198;36m      BYE !                         \u001b[1000D"
  sleep 0.085
  echo -en "\e[38;2;252;198;36m     BYE !!                         \u001b[1000D"
  sleep 0.085
  echo -en "\e[38;2;252;198;36m    BYE !!!                         \u001b[1000D"
  sleep 0.085
  echo -en "\e[38;2;252;198;36m   BYE !!!                          \u001b[1000D"
  sleep 0.085
  echo -en "\e[38;2;252;198;36m  BYE !!!                           \u001b[1000D"
  sleep 0.085
  echo -en "\e[38;2;252;198;36m  YE !!!                            \u001b[1000D"
  sleep 0.085
  echo -en "\e[38;2;252;198;36m  E !!!                             \u001b[1000D"
  sleep 0.085
  echo -en "\e[38;2;252;198;36m   !!!                              \u001b[1000D"
  sleep 0.085
  echo -en "\e[38;2;252;198;36m  !!!                               \u001b[1000D"
  sleep 0.085
  echo -en "\e[38;2;252;198;36m  !!                                \u001b[1000D"
  sleep 0.085
  echo -en "\e[38;2;252;198;36m  !                               \u001b[1000D\a"
  sleep 0.085
  exit
}

function load_autocomplete_now() {
  fpath=(${AHMYZSH_PLUGINS}/nestjs-cli-completion ${fpath})
  fpath=(${AHMYZSH_PLUGINS}/zsh-better-npm-completion ${fpath})
  fpath=(${AHMYZSH_PLUGINS}/yarn-autocompletions ${fpath})
  source_ "${AHMYZSH_PLUGINS}/zsh-better-npm-completion/zsh-better-npm-completion.plugin.zsh"
  source_ "${AHMYZSH_PLUGINS}/yarn-autocompletions/yarn-autocompletions.plugin.zsh"
  source_ "/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
  source_ "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
  load_ "${ZSH_COMPLETION}/autocomplete.sh" "load_autocomplete"
  call_ npm_completion
}

function load_aliases() {
  call_ Load_all_files_d "${AHMYZSH_ENV}/aliases"
}

function load_options() {
  bindkey -e

  HISTFILE="${HOME}/.zsh_history"
  HISTSIZE=1000000
  SAVEHIST=1000000

  export PROMPT_EOL_MARK=''
  setopt PROMPT_CR
  unsetopt PROMPT_SP
  setopt appendhistory
  setopt autocd
  setopt BANG_HIST # Treat the '!' character specially during expansion.
  setopt beep
  setopt EXTENDED_HISTORY # Write the history file in the ":start:elapsed;command" format.
  setopt HIST_BEEP
  setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first when trimming history.
  # setopt HIST_FIND_NO_DUPS      # Do not display a line previously found.
  # setopt HIST_IGNORE_ALL_DUPS   # Delete old recorded entry if new entry is a duplicate.
  # setopt HIST_IGNORE_DUPS       # Don't record an entry that was just recorded again.
  setopt HIST_IGNORE_SPACE  # Don't record an entry starting with a space.
  setopt HIST_REDUCE_BLANKS # Remove superfluous blanks before recording entry.
  # setopt HIST_SAVE_NO_DUPS      # Don't write duplicate entries in the history file.
  setopt HIST_VERIFY        # Don't execute immediately upon history expansion.
  setopt INC_APPEND_HISTORY # Write to the history file immediately, not when the shell exits.
  setopt INTERACTIVE_COMMENTS
  setopt SHARE_HISTORY # Share history between all sessions.

  export TERM="xterm-256color"
  export CLICOLOR='1'
  export LSCOLORS='GxFxCxDxBxDgedabagacad'
  export GPG_TT=(tty)

  # Correctly display UTF-8 with combining characters.
  if [ "$TERM_PROGRAM" = "Apple_Terminal" ]; then
    setopt combiningchars
  fi
  # disable log
  [ -r "/etc/zshrc_$TERM_PROGRAM" ] && . "/etc/zshrc_$TERM_PROGRAM"

  TIMEFMT=$'\n================\nCPU\t%P\nuser\t%*U\nsystem\t%*S\ntotal\t%*E'

}

function load_oh_my_zsh() {

  # Uncomment the following line to disable bi-weekly auto-update checks.
  DISABLE_AUTO_UPDATE="true"

  # Uncomment the following line to disable auto-setting terminal title.
  DISABLE_AUTO_TITLE="true"

  # Uncomment the following line to enable command auto-correction.
  # ENABLE_CORRECTION="true"

  # Uncomment the following line to display red dots whilst waiting for completion.
  COMPLETION_WAITING_DOTS="true"

  # Uncomment the following line if you want to disable marking untracked files
  # under VCS as dirty. This makes repository status check for large repositories
  # much, much faster.
  DISABLE_UNTRACKED_FILES_DIRTY="true"
  plugins=(
    # zsh-autosuggestions
    # zsh-syntax-highlighting
    git
    redis-cli
  )
  # alias-finder
  # colorize
  # dnf
  # emoji
  # gem
  # git
  # git-auto-fetch
  # git-hubflow
  # git-prompt
  # github
  # man
  # node
  # npm
  # rbenv
  # redis-cli
  # ruby
  # safe-paste
  # systemadmin
  # systemd
  # tmux
  # tmuxinator
  # vscode
  # yarn
  source $ZSH/oh-my-zsh.sh
  unalias ll
  # echo -n "${normal}$CLRLN$LDLCLR$(tput setaf 2) \uf013 ${bold} DONE! load_oh_my_zsh()${normal}"
}

function load_zshenv() {
  #   #$ Interactive,Script,login,non-login

  ## load_path_now
  call_ load_path

  ## load_functions_now
  load_ "${ZSH_SOURCES}/functions.zsh" "load_functions_definitions"
  source_ "${ZSH_FUNCTIONS_FOLDER}/getvscodeportable.zsh"

  [ "${VERBOSA}" -gt 0 ] && echo "${BEGIN_HOURGLASS_END_1} load_zshenv in $(timer_all) ms !${END_FUNCTION}"
}

function load_zshrc() {
  #   #$ Interactive,login,non-login

  load_my_powerlevel10k_now
  # activate_instant_prompt
  activate_normal_prompt

  if [ "${PARENT_ENV_LOADED}" != 'true' ]; then
    (compute_path &) # >/dev/null
  fi

  call_ load_oh_my_zsh

  load_ "${CUSTOM_ZSH}/sources/options-list.zsh" "load_options_list"
  call_ load_options

  # https://github.com/zsh-users/zsh-autosuggestions#configuration
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#677787"

  # https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
  ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

  zle_highlight=(region:standout special:standout
    suffix:bold isearch:underline paste:none)

  call_ load_autocomplete_now

  export PAGER="/usr/bin/most -s"
}

function precmd() {

  #   #$ Executed before each prompt. Note that precommandfunctions are not
  #   #$ re-executed simply because the command line is redrawn, as happens, for
  #   #$ example, when a notification about an exiting job is displayed.

  if [ "$ENV_LOADED" != 'true' ]; then
    export PARENT_ENV_LOADED='true'
    ENV_LOADED='true'

    right_prompt_off
    # hardcls
    echo "  ${BEGIN_HOURGLASS_END_1} READY in $(timer_all) ms !${END_FUNCTION}"
    echo -n "\e[30m   # \e[38;2;0;122;204m>  Code: $(code -v | grep '1\.') \u001b[31m\n"
    # echo -n "\e[30m   # >\e[30m\e[31m\n"
    echo -n "\e[30m   # \e[38;2;55;118;171m>  $(python -V) \u001b[31m\n"
    # echo -n "\e[30m   # >\e[30m\e[31m\n"
    echo -n "\e[30m   # \e[38;2;51;153;51m>  Node: $(node -v) \u001b[31m\n"
    echo -n "\e[30m   # \e[38;2;203;56;55m>  NPM: $(npm -v) \u001b[31m\n"
    echo -n "\e[30m   # \e[38;2;44;142;187m>  Yarn: $(yarn -v) \u001b[31m\n"
    echo -n "\e[30m   # \e[38;2;0;122;204m>  TSC: $(tsc -v) \u001b[31m\n"
    # echo -n "\e[30m   # >\e[30m\e[31m\n"
    echo -n "\e[30m   # \e[38;2;252;198;36m>  $(uname): $(uname -r) \u001b[31m\n"
    echo -n "\e[30m   # \e[37m>  $(zsh --version | grep zsh) \u001b[31m\n"

    echo -n "\u001b[37m\n"
    echo -e "\a"
  fi
  # exit
}
