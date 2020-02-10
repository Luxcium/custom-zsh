function source_all() {

	function load_() {
		TIMER_THEN=$(/usr/local/bin/gdate +%s%N)
		. "${1}"
		eval ${2}
		echo "${BEGIN_FUNCTION} $(timer_now) '${2}()' ${END_FUNCTION}"
	}

	function source_() {
		TIMER_THEN=$(/usr/local/bin/gdate +%s%N)
		. "${1}"
		echo "${BEGIN_SOURCING} $(timer_now) ${1} ${END_SOURCING}"
	}

	function source_notice_now() {
		source_ "${CUSTOM_ZSH}/notice.sh"
	}

	function activate_instant_prompt() {
		# # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
		# # Initialization code that may require console input (password prompts, [y/n]
		# # confirmations, etc.) must go above this block, everything else may go below.
		# clear
		hardcls
		typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
		typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

		local S1="${ZSH_SOURCES}/instant-prompt"
		echo "${normal}${CLRLN}${BYL9K_GNU}$(tput setaf 2) ${COG_ICO}  > !! ${S1} ${END_LOADING} $(tput setaf 2)${BKBK}${normal}"
		# echo "${normal}${CLRLN}${FNB} ${H_SYM} $(tput setaf 2)${COG_ICO}  ${FNB}> 00 $(tput setaf 2) ${S1} ${END_SOURCING} $(tput setaf 2)${BKBK}${normal}"
		. "${S1}"
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

	function source_powerlevel10k_now() {
		export ZSH_THEME="powerlevel10k/powerlevel10k"
		source_ "${POWERLEVEL10K}/powerlevel10k.zsh-theme"
	}

	function load_my_pl10K_layout_now() {
		load_ "${ZSH_LAYOUTS}/pl10K-Layout.zsh" "load_pl10K"
	}

	function load_options_now() {
		load_ "${ZSH_SOURCES}/options.zsh" "load_options"
	}

	function load_oh_my_zsh_now() {
		load_ "${ZSH_SOURCES}/load-oh-my-zsh.zsh" "load_oh_my_zsh"
	}

	function load_autocomplete_now() {
		load_ "${ZSH_COMPLETION}/autocomplete.sh" "load_autocomplete"
	}

	function compute_pl10K_now() {
		load_ "${ZSH_LAYOUTS}/pl10K-Layout.zsh" "compute_pl10k"
	}

	# function load_fab_four_now() {
	# 	# TIMER_THEN=$(/usr/local/bin/gdate +%s%N)

	# 	## source_functions_now
	# 	load_ "${ZSH_SOURCES}/functions.zsh" "load_functions_definitions"
	# 	## source_aliases_now
	# 	export MY_ALIASES="${CUSTOM_ZSH}/aliases.sh"
	# 	load_ "${MY_ALIASES}" "load_aliases"
	# 	## source_layouts_now
	# 	export BASE_LAYOUTS="${ZSH_SOURCES}/layouts/base-layouts.sh"
	# 	load_ "${BASE_LAYOUTS}" "load_layouts"
	# 	## source_flags_now
	# 	load_ "${ZSH_FLAGS}/flg-shortcuts.sh" "init_flags"
	# 	## source_path_now
	# 	source_ "${ZSH_COMPUTE}/path.zsh"
	# 	. $HOME/.cache/path.env

	# 	# echo "${BEGIN_FUNCTION} $(timer_now) 'load_fab_four_now()' ${END_FUNCTION}"
	# }

	# function source_path_now() {
	# 	source_ "${ZSH_COMPUTE}/path.zsh"
	# 	. $HOME/.cache/path.env
	# }

}

function load_zshenv() {
	# 	#$ Interactive,Script,login,non-login
	# if [ "$PARENT_ENV_LOADED" != 'true' ]; then
	# load_oh_my_zsh_now
	# load_options_now
	# fi

	## source_functions_now
	load_ "${ZSH_SOURCES}/functions.zsh" "load_functions_definitions"
	## source_aliases_now
	export MY_ALIASES="${CUSTOM_ZSH}/aliases.sh"
	load_ "${MY_ALIASES}" "load_aliases"
	## source_flags_now
	load_ "${ZSH_FLAGS}/flg-shortcuts.sh" "init_flags"
	## source_path_now
	source_ "${ZSH_COMPUTE}/path.zsh"
	. $HOME/.cache/path.env

	load_options_now

}

function load_zshrc() {
	# 	#$ Interactive,login,non-login

	activate_instant_prompt

	if [ "$PARENT_ENV_LOADED" != 'true' ]; then
		compute_path
	# else
	fi

	load_oh_my_zsh_now
	load_autocomplete_now

	load_my_pl10K_layout_now

	## source_layouts_now
	export BASE_LAYOUTS="${ZSH_SOURCES}/layouts/base-layouts.sh"
	load_ "${BASE_LAYOUTS}" "load_layouts"

	source_powerlevel10k_now

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

	fi
	if [ "$NODE_VERSION" != "$(cut -d 'v' -f 2 <<<$(node -v))" ]; then
		compute_pl10k
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
	# echo "${BEGIN_FUNCTION} 'load_zlogout()' ${END_FUNCTION}"
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
