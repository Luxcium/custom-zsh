function source_all() {

	function activate_instant_prompt() {
		# # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
		# # Initialization code that may require console input (password prompts, [y/n]
		# # confirmations, etc.) must go above this block, everything else may go below.

		typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
		typeset -g ZSH_THEME="../../powerlevel10k/powerlevel10k"

		hardcls
		# clear
		# echo ${BBCOLR} toto
		echo -n "${CLRLN}${normal}${BYL9K_GNU}$(tput setaf 2) ${COG_ICO}${bold} $(tput setaf 2)GNU/Linux utils$(tput setaf 2) are ... ${BKBK}${normal}${LEFT_TERMINATOR}\n"
		source_ "${ZSH_SOURCES}/instant-prompt"
		source_ "${POWERLEVEL10K}/powerlevel10k.zsh-theme"
		call_ pl10k_prompt_on
	}

	function load_oh_my_zsh_now() {
		load_ "${ZSH_SOURCES}/load-oh-my-zsh.zsh" "load_oh_my_zsh"
	}

	function load_my_powerlevel10k_now() {
		## load_my_pl10K_layout_now
		load_ "${ZSH_LAYOUTS}/pl10K-Layout.zsh" "load_my_powerlevel10k"
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
		. $HOME/.cache/path.env
	}

	function load_autocomplete_now() {
		load_ "${ZSH_COMPLETION}/autocomplete.sh" "load_autocomplete"
		call_ npm_completion

		# Load Zsh tools for syntax highlighting and autosuggestions
		export HOMEBREW_FOLDER="/usr/local/share"
		source_ "${HOMEBREW_FOLDER}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
		source_ "${HOMEBREW_FOLDER}/zsh-autosuggestions/zsh-autosuggestions.zsh"
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

function load_zshenv() {
	# 	#$ Interactive,Script,login,non-login

	## load_options_now
	load_ "${ZSH_SOURCES}/options.zsh" "load_options"

	## load_my_pl10K_layout_now
	# call_ source_prompt

	## load_path_now
	call_ load_path

	## load_aliases_now
	export MY_ALIASES="${CUSTOM_ZSH}/aliases.sh"
	load_ "${MY_ALIASES}" "load_aliases"

	## load_functions_now
	load_ "${ZSH_SOURCES}/functions.zsh" "load_functions_definitions"

	[ "${VERBOSA}" -gt 0 ] && echo "${BEGIN_HOURGLASS_END_0} load_zshenv in $(timer_all) ms !${END_FUNCTION}"
}

function load_zshrc() {
	# 	#$ Interactive,login,non-login
	# load_path

	load_my_powerlevel10k_now
	activate_instant_prompt
	load_oh_my_zsh_now
	load_autocomplete_now

	if [ "${PARENT_ENV_LOADED}" != 'true' ]; then
		compute_path
	fi

}

function precmd() {

	# 	#$ Executed before each prompt. Note that precommandfunctions are not
	# 	#$ re-executed simply because the command line is redrawn, as happens, for
	# 	#$ example, when a notification about an exiting job is displayed.

	if [ "$ENV_LOADED" != 'true' ]; then
		export PARENT_ENV_LOADED='true'
		ENV_LOADED='true'
		hardcls
		if [ "${VERBOSA}" -gt 3 ]; then

			if [ "$GNU_COREUTILS" != 'true' ]; then
				echo -n "\u001b[1F                                        ${BEGIN_HOURGLASS_END_0} READY in $(timer_all) ms !${END_FUNCTION}"
			else
				echo -n "\u001b[1F                                    ${BEGIN_HOURGLASS_END_0} READY in $(timer_all) ms !${END_FUNCTION}"
			fi
		else
			if [ "$GNU_COREUTILS" != 'true' ]; then
				echo -n "                                        ${BEGIN_HOURGLASS_END_0} READY in $(timer_all) ms !${END_FUNCTION}"
			else
				echo -n "                                    ${BEGIN_HOURGLASS_END_0} READY in $(timer_all) ms !${END_FUNCTION}"
			fi
		fi
		. "${ZSH_COMPUTE}/path.zsh"
		gnu_coreutils
	else
		# if [ "${NODE_VERSION}" != "$(cut -d 'v' -f 2 <<<$(node -v))" ]; then
		# 	call_ compute_pl10k
		# fi
	fi

}

function load_zlogout() {
	# [ "${VERBOSA}" = 'true' ] && echo "${BEGIN_FUNCTION} 'load_zlogout()' ${END_FUNCTION}"
	# 	#$ Interactive,login
	source_saybye_now
	(compute_path &)
	(_p9k_dump_instant_prompt &)
	say_bye_tom
	hardcls
}
