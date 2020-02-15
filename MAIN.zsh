function source_all() {

	function load_my_powerlevel10k_now() {
		source_ "${ZSH_LAYOUTS}/pl10K-Layout.zsh"
		call_ "load_my_powerlevel10k"
	}

	function activate_instant_prompt() {
		# # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
		# # Initialization code that may require console input (password prompts, [y/n]
		# # confirmations, etc.) must go above this block, everything else may go below.

		typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
		export ZSH_THEME="../../powerlevel10k/powerlevel10k"

		## load_my_pl10K_layout_now
		source_ "${ZSH_LAYOUTS}/pl10K-Layout.zsh"
		call_ "load_my_powerlevel10k"
		hardcls
		# [ "${VERBOSA}" = 'true' ] &&
		print "${normal}${CLRLN}${BYL9K_GNU}$(tput setaf 2) ${COG_ICO}  GNU/Linux utils are ... ${END_LOADING} $(tput setaf 2)${BKBK}${normal}"
		source_ "${ZSH_SOURCES}/instant-prompt"
		source_ "${POWERLEVEL10K}/powerlevel10k.zsh-theme"
		call_ pl10k_promt_on
		call_ compute_pl10k
		# call_ compute_path
		# call_ pl10k_right_prompt_off
	}

	function source_powerline_now() {
		source_ "${POWERLINE_BINDINGS}/zsh/powerline.zsh"
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

	function load_oh_my_zsh_now() {
		load_ "${ZSH_SOURCES}/load-oh-my-zsh.zsh" "load_oh_my_zsh"
	}

	function load_autocomplete_now() {
		load_ "${ZSH_COMPLETION}/autocomplete.sh" "load_autocomplete"
		call_ npm_completion

		# Load Zsh tools for syntax highlighting and autosuggestions
		export HOMEBREW_FOLDER="/usr/local/share"
		source_ "${HOMEBREW_FOLDER}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
		source_ "${HOMEBREW_FOLDER}/zsh-autosuggestions/zsh-autosuggestions.zsh"

	}

	function compute_pl10K_now() {
		call_ "compute_pl10k"
	}

	function load_path() {
		## load_flags_now
		source_ "${ZSH_COMPUTE}/path.zsh"
		load_ "${ZSH_FLAGS}/flg-shortcuts.sh" "init_flags"
		. $HOME/.cache/path.env
	}

	function reload_path() {
		load_path
		compute_path
	}

}

function load_zshenv() {
	# 	#$ Interactive,Script,login,non-login

	## load_aliases_now
	export MY_ALIASES="${CUSTOM_ZSH}/aliases.sh"
	load_ "${MY_ALIASES}" "load_aliases"

	## load_options_now
	load_ "${ZSH_SOURCES}/options.zsh" "load_options"

	[ "${VERBOSA}" -gt 0 ] && echo "${BEGIN_HOURGLASS_END_0} load_zshenv in $(timer_all) ms !${END_FUNCTION}"
}

function load_zshrc() {
	# 	#$ Interactive,login,non-login
	load_path

	## load_functions_now
	load_ "${ZSH_SOURCES}/functions.zsh" "load_functions_definitions"

	activate_instant_prompt
	load_oh_my_zsh_now
	load_autocomplete_now

	if [ "${PARENT_ENV_LOADED}" != 'true' ]; then
		compute_path
	fi

}

function precmd() {

	# 	#$ Executed before each prompt. Note that precommand functions are not
	# 	#$ re-executed simply because the command line is redrawn, as happens, for
	# 	#$ example, when a notification about an exiting job is displayed.

	if [ "$ENV_LOADED" != 'true' ]; then
		export PARENT_ENV_LOADED='true'
		ENV_LOADED='true'
		echo "${BEGIN_HOURGLASS_END_0} READY in $(timer_all) ms !${END_FUNCTION}"
		hardcls
		gnu_coreutils
	else
		# if [ "${NODE_VERSION}" != "$(cut -d 'v' -f 2 <<<$(node -v))" ]; then
		# 	call_ compute_pl10k
		# fi
	fi

}

function load_zprofile() {
	# pre load_zshrc()
	# 	#$ Interactive,login

}
#

function load_zlogin() {
	# post load_zshrc()
	# 	#$ Interactive,login

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

# /bin/bash ~ The bash executable
# /etc/profile ~ The systemwide initialization file, executed for login shells
# ~/.bash_profile ~ The personal initialization file, executed for login shells
# ~/.bashrc ~ The individual per-interactive-shell startup file
# ~/.bash_logout ~ The individual login shell cleanup file, executed when a login shell exits
# ~/.inputrc ~ Individual readline initialization file

# You will also have these commands:
# imgcat filename
#   Displays the image inline.
# imgls
#   Shows a directory listing with image thumbnails.
# it2api
#   Command-line utility to manipulate iTerm2.
# it2attention start|stop|fireworks
#   Gets your attention.
# it2check
#   Checks if the terminal is iTerm2.
# it2copy [filename]
#   Copies to the pasteboard.
# it2dl filename
#   Downloads the specified file, saving it in your Downloads folder.
# it2setcolor ...
#   Changes individual color settings or loads a color preset.
# it2setkeylabel ...
#   Changes Touch Bar function key labels.
# it2ul
#   Uploads a file.
# it2universion
#   Sets the current unicode version.
