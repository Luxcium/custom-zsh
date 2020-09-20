function source_all_zsh() {

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

		source_ "${ZSH_SOURCES}/instant-prompt"
		source_ "${POWERLEVEL10K}/powerlevel10k.zsh-theme"

	}

	function load_oh_my_zsh_now() {
		load_ "${ZSH_SOURCES}/load-oh-my-zsh.zsh" "load_oh_my_zsh"
	}

	function load_my_powerlevel10k_now() {
		## load_my_pl10K_layout_now
		source_ "${ZSH_LAYOUTS}/pl10K-Layout.zsh"
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
	function load_autocomplete_now() {
		load_ "${ZSH_COMPLETION}/autocomplete.sh" "load_autocomplete"
		call_ npm_completion
		source_ "/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
		source_ "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

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
}
