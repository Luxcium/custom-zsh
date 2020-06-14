function source_all() {

	function activate_instant_prompt() {
		# # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
		# # Initialization code that may require console input (password prompts, [y/n]
		# # confirmations, etc.) must go above this block, everything else may go below.

		typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
		typeset -g ZSH_THEME="../../powerlevel10k/powerlevel10k"

		# hardcls
		# clear
		# echo ${BBCOLR} toto

		# echo -n "${CLRLN}${normal}${BYL9K_GNU}$(tput setaf 2) ${COG_ICO}${bold} $(tput setaf 2)GNU/Linux utils$(tput setaf 2) are ... ${BKBK}${normal}${LEFT_TERMINATOR}\n"
		. "${ZSH_SOURCES}/instant-prompt"
		. "${POWERLEVEL10K}/powerlevel10k.zsh-theme"

	}

	function load_oh_my_zsh_now() {
		load_ "${ZSH_SOURCES}/load-oh-my-zsh.zsh" "load_oh_my_zsh"
	}

	function load_my_powerlevel10k_now() {
		## load_my_pl10K_layout_now
		. "${ZSH_LAYOUTS}/pl10K-Layout.zsh"
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
		. $HOME/.cache/path.env
	}

	function load_autocomplete_now() {
		load_ "${ZSH_COMPLETION}/autocomplete.sh" "load_autocomplete"
		call_ npm_completion
		source_ "/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
		source_ "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
		# /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
		# /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
		# Load Zsh tools for syntax highlighting and autosuggestions
		# export HOMEBREW_FOLDER="/usr/local/share"
		# source_ "${HOMEBREW_FOLDER}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
		# source_ "${HOMEBREW_FOLDER}/zsh-autosuggestions/zsh-autosuggestions.zsh"
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
	#   #$ Interactive,Script,login,non-login

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

	[ "${VERBOSA}" -gt 0 ] && echo "${BEGIN_HOURGLASS_END_1} load_zshenv in $(timer_all) ms !${END_FUNCTION}"
}

function load_zshrc() {
	#   #$ Interactive,login,non-login
	# load_path

	load_my_powerlevel10k_now
	activate_instant_prompt
	load_oh_my_zsh_now
	load_autocomplete_now

	if [ "${PARENT_ENV_LOADED}" != 'true' ]; then
		compute_path
	fi

	# export LESS_TERMCAP_mb=$'\e[1;32m'
	# export LESS_TERMCAP_md=$'\e[1;32m'
	# export LESS_TERMCAP_me=$'\e[0m'
	# export LESS_TERMCAP_se=$'\e[0m'
	# export LESS_TERMCAP_so=$'\e[01;33m'
	# export LESS_TERMCAP_ue=$'\e[0m'
	# export LESS_TERMCAP_us=$'\e[1;4;31m'

	## Less Colors for Man Pages
	# export LESS=-R
	# export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
	# export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
	# export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
	# export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
	# export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
	# export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
	# export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

	export PAGER="/usr/bin/most -s"

	# function man() {
	# 	LESS_TERMCAP_md=$'\e[01;31m' \
	# 		LESS_TERMCAP_me=$'\e[0m' \
	# 		LESS_TERMCAP_se=$'\e[0m' \
	# 		LESS_TERMCAP_so=$'\e[01;44;33m' \
	# 		LESS_TERMCAP_ue=$'\e[0m' \
	# 		LESS_TERMCAP_us=$'\e[01;32m' \
	# 		command man "$@"
	# }
}

function precmd() {

	#   #$ Executed before each prompt. Note that precommandfunctions are not
	#   #$ re-executed simply because the command line is redrawn, as happens, for
	#   #$ example, when a notification about an exiting job is displayed.

	if [ "$ENV_LOADED" != 'true' ]; then
		export PARENT_ENV_LOADED='true'
		ENV_LOADED='true'

		. "${ZSH_COMPUTE}/path.zsh"

		hardcls
		echo "${BEGIN_HOURGLASS_END_1} READY in $(timer_all) ms !${END_FUNCTION}"
		echo -n "\u001b[37m   >  $(python -V) \u001b[31m\n"
		echo -n "\u001b[32m   >  Node: $(node -v) \u001b[31m\n"
		echo -n "\u001b[31m   >  NPM: $(npm -v) \u001b[31m\n"
		echo -n "\u001b[33m   >  Yarn: $(yarn -v) \u001b[31m\n"
		echo -n "\u001b[34m   >  TSC: $(tsc -v) \u001b[31m"
		echo -n "\u001b[37m "
		right_prompt_off
	fi

}

function load_zlogout() {
	# [ "${VERBOSA}" = 'true' ] && echo "${BEGIN_FUNCTION} 'load_zlogout()' ${END_FUNCTION}"
	#   #$ Interactive,login
	source_saybye_now
	(compute_path &)
	(_p9k_dump_instant_prompt &)
	say_bye_tom
	# hardcls
}

# |----------------|-----------|-----------|------|
# |                |Interactive|Interactive|Script|
# |----------------|-----------|-----------|------|
# |                |login      |non-login  |      |
# |----------------|-----------|-----------|------|
# |/etc/zshenv     |    A      |    A      |  A   |
# |~/.zshenv       |    B      |    B      |  B   |
# |/etc/zprofile   |    C      |           |      |
# |~/.zprofile     |    D      |           |      |
# |/etc/zshrc      |    E      |    C      |      |
# |~/.zshrc        |    F      |    D      |      | ***
# |/etc/zlogin     |    G      |           |      |
# |~/.zlogin       |    H      |           |      |
# |                |           |           |      |
# |                |           |           |      |
# |~/.zlogout      |    I      |           |      |
# |/etc/zlogout    |    J      |           |      |
# |----------------|-----------|-----------|------|
