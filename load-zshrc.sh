function load_zshrc() {
  #   #$ Interactive,login,non-login

  load_my_powerlevel10k_now
  activate_instant_prompt
  # activate_normal_prompt

  if [ "${PARENT_ENV_LOADED}" != 'true' ]; then
    (compute_path &) >/dev/null
  fi

  load_ "${ZSH_SOURCES}/options-list.zsh" "load_options_list"
  load_ "${ZSH_SOURCES}/options.zsh" "load_options"

  # https://github.com/zsh-users/zsh-autosuggestions#configuration
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#677787"

  # https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
  ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

  zle_highlight=(region:standout special:standout
    suffix:bold isearch:underline paste:none)

  load_autocomplete_now
  load_oh_my_zsh_now

  export PAGER="/usr/bin/most -s"
}
