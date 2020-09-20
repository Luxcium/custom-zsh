function load_zshenv() {
  #   #$ Interactive,Script,login,non-login

  ## load_path_now
  call_ load_path

  ## load_functions_now
  load_ "${ZSH_SOURCES}/functions.zsh" "load_functions_definitions"
  # source_ "${ZSH_FUNCTIONS_FOLDER}/getportablecode.sh"
  source_ "${ZSH_FUNCTIONS_FOLDER}/getvscodeportable.zsh"

  # TODO SECTION: Fix thiss mess :
  ## load_aliases_now
  source /home/luxcium/ahmyzsh/custom-zsh/aliases/aliases.sh
  export ALIASES_FOLDER="${CUSTOM_ZSH}/aliases"
  export MY_ALIASES="${CUSTOM_ZSH}/aliases.sh"
  ls -d1 ${ALIASES_FOLDER}/*.sh | foreachline source
  load_ "${MY_ALIASES}" "load_aliases"
  source_ "${ALIASES_FEDORA_FOLDER}/bells.sh"
  ZSH_LOVERS
  # TODO SECTION END: Fix thiss mess :

  [ "${VERBOSA}" -gt 0 ] && echo "${BEGIN_HOURGLASS_END_1} load_zshenv in $(timer_all) ms !${END_FUNCTION}"
}
