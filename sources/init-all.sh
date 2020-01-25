function source_all() {
    source "${ZSH_SOURCES}/load-oh-my-zsh.zsh"
    source "${ZSH_FLAGS}/flg-shortcuts.sh"
    source "${POWERLEVEL10K}/powerlevel10k.zsh-theme"
    source "${PWRLN_ZSH_CONF}"
    source "${TMUX_BIN}/tmux-functions.zsh"

    # source "${ZSH_SOURCES}/.autocomplete.sh"
    # source "${MY_ALIASES}"
    # source "${ZSH_SOURCES}/.compute_path.sh"
    # source "${ZSH_SOURCES}/.compute_p9k.sh"
    # source_options

    # if [ "$LOAD_LATER" != 'true' ]; then

    # fi
}
function init_all() {
    SHOW_LOAD_CUTLS="true"
    ENV_LOADED="false"

    . "${AHMYZSH}/LOAD_ENV.zsh"
    . "${MY_ALIASES}"
}
init_all
