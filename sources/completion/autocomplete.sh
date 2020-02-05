function load_autocomplete() {

    source "${ZSH_COMPLETION}/node_bash_completion.sh"
    source "${ZSH_COMPLETION}/npm.completion.sh"
    npm_completion
    # Load Zsh tools for syntax highlighting and autosuggestions
    HOMEBREW_FOLDER="/usr/local/share"
    source "$HOMEBREW_FOLDER/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
    source "$HOMEBREW_FOLDER/zsh-autosuggestions/zsh-autosuggestions.zsh"

    # The following lines were added by compinstall
    zstyle ':completion:*' completer _list _oldlist _expand _complete _ignored _match _correct _approximate _prefix
    zstyle ':completion:*' expand prefix
    zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:]}={[:upper:]}'
    zstyle :compinstall filename "${HOME}/.zshrc"

    autoload -U +X compinit && compinit
    autoload -U +X bashcompinit && bashcompinit

    autoload -Uz compinit
    for dump in "${HOME}/.zcompdump(N.mh+24)"; do
        compinit
    done
    compinit -C

    # End of lines added for compinstall
    # autoload -U compinit && compinit
}
