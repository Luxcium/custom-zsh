function source_all() {

	TIMER_THEN=$(/usr/local/bin/gdate +%s%N)
	function timer_now() {
		local TIMER_NOW=$(/usr/local/bin/gdate +%s%N)
		local TIMER_VALUE=$(((${TIMER_NOW} - ${TIMER_THEN}) / 1000000))

		echo -n "${TIMER_VALUE} "
		return 0
	}

	function activate_instant_prompt() {
		# # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
		# # Initialization code that may require console input (password prompts, [y/n]
		# # confirmations, etc.) must go above this block, everything else may go below.
		# clear
		hardcls
		typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
		export POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

		local S1="${ZSH_SOURCES}/instant-prompt"
		echo "${normal}${CLRLN}${BYL9K_GNU}$(tput setaf 2) ${COG_ICO} ${S1} ${END_LOADING} $(tput setaf 2)${BKBK}${normal}"
		. "${S1}"

	}

	function load_compute_path_now() {

		TIMER_THEN=$(/usr/local/bin/gdate +%s%N)
		local S1="${ZSH_COMPUTE}/path.zsh"
		. "${S1}"
		. $HOME/.cache/path.env
		# compute_path
		echo "${BEGIN_FUNCTION} $(timer_now) 'load_compute_path_now()' ${END_FUNCTION}"
	}

	function source_notice_now() {
		TIMER_THEN=$(/usr/local/bin/gdate +%s%N)
		local S1="${CUSTOM_ZSH}/notice.sh"
		. "${S1}"
		echo "${BEGIN_LOADING} $(timer_now) ${S1} ${END_LOADING}"
	}

	function source_layouts_now() {

		TIMER_THEN=$(/usr/local/bin/gdate +%s%N)
		export BASE_LAYOUTS="${ZSH_SOURCES}/layouts/base-layouts.sh"
		. "${BASE_LAYOUTS}"
		load_layouts
		echo "${BEGIN_FUNCTION} $(timer_now) 'load_layouts()' ${END_FUNCTION}"
	}

	function source_aliases_now() {
		TIMER_THEN=$(/usr/local/bin/gdate +%s%N)
		export MY_ALIASES="${CUSTOM_ZSH}/aliases.sh"
		. "${MY_ALIASES}"
		load_aliases
		echo "${BEGIN_FUNCTION} $(timer_now) 'load_aliases()' ${END_FUNCTION}"
	}

	function source_functions_now() {
		TIMER_THEN=$(/usr/local/bin/gdate +%s%N)
		local S1="${ZSH_SOURCES}/functions.zsh"
		. "${S1}"
		load_functions_definitions
		echo "${BEGIN_FUNCTION} $(timer_now) 'load_functions_definitions()' ${END_FUNCTION}"
	}

	function source_flags_now() {
		TIMER_THEN=$(/usr/local/bin/gdate +%s%N)
		local S1="${ZSH_FLAGS}/flg-shortcuts.sh"
		. "${S1}"
		init_flags
		echo "${BEGIN_FUNCTION} $(timer_now) 'init_flags()' ${END_FUNCTION}"
	}

	function source_saybye_now() {
		TIMER_THEN=$(/usr/local/bin/gdate +%s%N)
		local S1="${ZSH_SOURCES}/say-bye.zsh"
		. "${S1}"
		echo "${BEGIN_LOADING} $(timer_now) ${S1} ${END_LOADING}"
	}

	function source_TMUX_loader_now() {
		TIMER_THEN=$(/usr/local/bin/gdate +%s%N)
		local S1="${TMUX_BIN}/tmux-loader.sh"
		. "${S1}"
		load_tmux
		echo "${BEGIN_FUNCTION} $(timer_now) 'load_tmux()' ${END_FUNCTION}"
	}

	function load_options_now() {
		TIMER_THEN=$(/usr/local/bin/gdate +%s%N)
		local S1="${ZSH_SOURCES}/options.zsh"
		. "${S1}"
		load_options
		echo "${BEGIN_FUNCTION} $(timer_now) 'load_options()' ${END_FUNCTION}"
	}

	function load_oh_my_zsh_now() {
		TIMER_THEN=$(/usr/local/bin/gdate +%s%N)
		local S1="${ZSH_SOURCES}/load-oh-my-zsh.zsh"
		. "${S1}"
		load_oh_my_zsh
		echo "${BEGIN_FUNCTION} $(timer_now) 'load_oh_my_zsh()' ${END_FUNCTION}"
		load_options_now
	}

	function source_autocomplete_now() {
		TIMER_THEN=$(/usr/local/bin/gdate +%s%N)
		local S1="${ZSH_COMPLETION}/autocomplete.sh"
		. "${S1}"
		load_autocomplete
		echo "${BEGIN_FUNCTION} $(timer_now) 'load_autocomplete()' ${END_FUNCTION}"
	}

	function source_powerline_now() {
		TIMER_THEN=$(/usr/local/bin/gdate +%s%N)
		local S1="${POWERLINE_BINDINGS}/zsh/powerline.zsh"
		. "${S1}"
		echo "${BEGIN_LOADING} $(timer_now) ${S1} ${END_LOADING}"
	}
	function load_powerlevel10k_now() {
		TIMER_THEN=$(/usr/local/bin/gdate +%s%N)
		local S1="${POWERLEVEL10K}/powerlevel10k.zsh-theme"
		. "${S1}"
		echo "${BEGIN_LOADING} $(timer_now) ${S1} ${END_LOADING}"
	}
	function load_my_pl10K_layout_now() {

		TIMER_THEN=$(/usr/local/bin/gdate +%s%N)
		local S1="${ZSH_LAYOUTS}/pl10K-Layout.zsh"
		. "${S1}"
		# echo "${BEGIN_LOADING} $(timer_now) ${S1} ${END_LOADING}"
		load_pl10K
		echo "${BEGIN_FUNCTION} $(timer_now) 'load_pl10K()' ${END_FUNCTION}"
	}
	function compute_pl10K_now() {
		TIMER_THEN=$(/usr/local/bin/gdate +%s%N)
		compute_pl10k
		echo "${BEGIN_FUNCTION} $(timer_now) 'compute_pl10k()' ${END_FUNCTION}"
	}

}

function load_zshenv() {
	# echo "${BEGIN_FUNCTION} 'load_zshenv()' ${END_FUNCTION}"
	# 	#$ Interactive,Script,login,non-login

	if [ "$PARENT_ENV_LOADED" != 'true' ]; then
		source_layouts_now
		load_compute_path_now
		source_autocomplete_now
		load_oh_my_zsh_now
	else
		load_compute_path_now
		source_autocomplete_now

	fi

	source_aliases_now
	source_functions_now
	source_flags_now
	source_TMUX_loader_now

}

function load_zprofile() {
	# echo "${BEGIN_FUNCTION} 'load_zprofile()' ${END_FUNCTION}"
	# 	#$ Interactive,login
}
#
function load_zshrc() {
	# echo "${BEGIN_FUNCTION} 'load_zshrc()' ${END_FUNCTION}"
	# 	#$ Interactive,login,non-login

	load_my_pl10K_layout_now
	activate_instant_prompt

	if [ "$PARENT_ENV_LOADED" != 'true' ]; then
		compute_path
	else
		load_oh_my_zsh_now
	fi

	load_powerlevel10k_now
	source_saybye_now

}

function load_zlogin() {
	# echo "${BEGIN_FUNCTION} 'load_zlogin()' ${END_FUNCTION}"
	# 	#$ Interactive,login

}

function load_zlogout() {
	# echo "${BEGIN_FUNCTION} 'load_zlogout()' ${END_FUNCTION}"
	# 	#$ Interactive,login
	(compute_path &)
	(_p9k_dump_instant_prompt &)
	say_bye_tom
	hardcls
	# 	# fi
}

function precmd() {

	# 	#$ Executed before each prompt. Note that precommand functions are not
	# 	#$ re-executed simply because the command line is redrawn, as happens, for
	# 	#$ example, when a notification about an exiting job is displayed.

	if [ "$ENV_LOADED" != 'true' ]; then
		export PARENT_ENV_LOADED='true'
		ENV_LOADED='true'
		# source_powerline_now
		hardcls
		# clear
		gnu_coreutils
	else

	fi
	if [ "$NODE_VERSION" != "$(cut -d 'v' -f 2 <<<$(node -v))" ]; then
		compute_pl10k
	fi

}
alias reload="source_load_all"
alias load="source_load_all"
function source_load_all() {
	toSD1n2 source_load_all_
}
function source_load_all_() {
	TIMER_THEN=$(/usr/local/bin/gdate +%s%N)

	AHMYZSH="${HOME}/ahmyzsh"

	. "${AHMYZSH}/initial_load.zsh"

	. "${AHMYZSH}/paths.sh"

	. "${CUSTOM_ZSH}/notice.sh"

	init_projects_paths
	init_paths
	load_my_envs

	source_all

	source_powerline_now

	source_layouts_now
	source_aliases_now
	source_flags_now
	source_functions_now
	load_compute_path_now
	load_oh_my_zsh_now
	source_autocomplete_now
	source_TMUX_loader_now

	compute_path
	load_oh_my_zsh
	load_options
	# load_autocomplete
	echo "${BEGIN_FUNCTION} $(timer_now) 'source_load_all()' ${END_FUNCTION}"

}

# # |----------------|-----------|-----------|------|
# # |                |Interactive|Interactive|Script|
# # |----------------|-----------|-----------|------|
# # |                |login      |non-login  |      |
# # |----------------|-----------|-----------|------|
# # |/etc/zshenv     |    A      |    A      |  A   |
# # |~/.zshenv       |    B      |    B      |  B   |
# # |/etc/zprofile   |    C      |           |      |
# # |~/.zprofile     |    D      |           |      |
# # |/etc/zshrc      |    E      |    C      |      |
# # |~/.zshrc        |    F      |    D      |      | ***
# # |/etc/zlogin     |    G      |           |      |
# # |~/.zlogin       |    H      |           |      |
# # |                |           |           |      |
# # |                |           |           |      |
# # |~/.zlogout      |    I      |           |      |
# # |/etc/zlogout    |    J      |           |      |
# # |----------------|-----------|-----------|------|

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
