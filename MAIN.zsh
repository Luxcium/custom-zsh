function source_all() {

	function activate_instant_prompt() {
		# # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
		# # Initialization code that may require console input (password prompts, [y/n]
		# # confirmations, etc.) must go above this block, everything else may go below.

		typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
		typeset -g ZSH_THEME="../../powerlevel10k/powerlevel10k"

		# echo -n "${CLRLN}${normal}${BYL9K_GNU}$(tput setaf 2) ${COG_ICO}${bold} $(tput setaf 2)GNU/Linux utils$(tput setaf 2) are ... ${BKBK}${normal}${LEFT_TERMINATOR}\n"
		hardcls
		echo "\u001b[1m      רֹוא יִהְי \u001b[0m"
		echo " ${BEGIN_HOURGLASS_END_1} ${FRD}${BOLD} ...${FGR} READY ${END_FUNCTION}"
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
		source_ $HOME/.cache/path.env
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

	function reload_path() {
		load_path
		call_ compute_path

	}

}

function load_zshenv() {
	# 	#$ Interactive,Script,login,non-login

	## load_options_now
	. "${ZSH_SOURCES}/options.zsh"
	load_options

	## load_my_pl10K_layout_now
	# call_ source_prompt

	## load_path_now
	reload_path

	## load_aliases_now
	export MY_ALIASES="${CUSTOM_ZSH}/aliases.sh"
	. "${MY_ALIASES}"
	load_aliases

	## load_functions_now
	. "${ZSH_SOURCES}/functions.zsh"
	load_functions_definitions

	[ "${VERBOSA}" -gt 0 ] && echo "${BEGIN_HOURGLASS_END_0}      'load_zshenv in $(timer_all) ms !'${END_FUNCTION}"
}

function load_zshrc() {
	# 	#$ Interactive,login,non-login

	load_my_powerlevel10k_now
	activate_instant_prompt
	load_oh_my_zsh_now
	load_autocomplete_now

	# if [ "${PARENT_ENV_LOADED}" != 'true' ]; then
	# fi

}

function precmd() {

	# 	#$ Executed before each prompt. Note that precommandfunctions are not
	# 	#$ re-executed simply because the command line is redrawn, as happens, for
	# 	#$ example, when a notification about an exiting job is displayed.

	if [ "$ENV_LOADED" != 'true' ]; then
		export PARENT_ENV_LOADED='true'
		ENV_LOADED='true'
		hardcls
		# cls
		# if [ "${VERBOSA}" -gt 3 ]; then
		echo "\u001b[1G\n ${BEGIN_HOURGLASS_END_3}      READY in $(timer_all) ms !${END_FUNCTION}"
		# else
		# echo -n " \u001b[1F                                    ${BEGIN_HOURGLASS_END_1} READY in $(timer_all) ms !${END_FUNCTION}"
		# fi
		. "${ZSH_COMPUTE}/path.zsh"
		# gnu_coreutils
	else
		# if [ "${NODE_VERSION}" != "$(cut -d 'v' -f 2 <<<$(node -v))" ]; then
		# 	call_ compute_pl10k
		# fi
	fi

}

function load_zlogout() {
	[ "${VERBOSA}" -gt 3 ] && echo "${BEGIN_FUNCTION} 'load_zlogout()' ${END_FUNCTION}"
	# 	#$ Interactive,login
	# source_saybye_now
	(compute_path &)
	(_p9k_dump_instant_prompt &)
	# say_bye_tom
	hardcls
}

# function load_zlogout() {
# 	# [ "${VERBOSA}" = 'true' ] && echo "${BEGIN_FUNCTION} 'load_zlogout()' ${END_FUNCTION}"
# 	# 	#$ Interactive,login
# 	source_saybye_now
# 	(compute_path &)
# 	(_p9k_dump_instant_prompt &)
# 	say_bye_tom
# 	hardcls
# }

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

function reload_all_x() {
	source_all
	load_zshenv
	load_zshrc
	precmd
	# load_zprofile
	# load_zlogin
}

main_into_luxcium_env() {

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

}

old_main_pc-master-race() {
	function source_all() {
		# echo "source_all()"
		function load_my_powerlevel10k_now() {
			source_ "${ZSH_LAYOUTS}/pl10K-Layout.zsh"
			call_ "load_my_powerlevel10k"
		}

		function source_prompt() {
			## load_my_pl10K_layout_now
			source_ "${ZSH_LAYOUTS}/pl10K-Layout.zsh"
			call_ "load_my_powerlevel10k"
		}

		function activate_instant_prompt() {
			# # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
			# # Initialization code that may require console input (password prompts, [y/n]
			# # confirmations, etc.) must go above this block, everything else may go below.

			typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
			typeset -g ZSH_THEME="../../powerlevel10k/powerlevel10k"

			hardcls
			print "${CLRLN}${normal}${BYL9K_GNU}$(tput setaf 2) ${COG_ICO} GNU/Linux utils are ... ${END_LOADING} $(tput setaf 2)${BKBK}${normal}"
			source_ "${ZSH_SOURCES}/instant-prompt"
			source_ "${POWERLEVEL10K}/powerlevel10k.zsh-theme"
			call_ pl10k_prompt_on
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
			load_ "${ZSH_FLAGS}/flg-shortcuts.sh" "init_flags"
			## source_ path.zsh
			source_ "${ZSH_COMPUTE}/path.zsh"
			## load_path
			. $HOME/.cache/path.env
		}

	}

	function load_zshenv() {
		# 	#$ Interactive,Script,login,non-login

		## load_options_now
		load_ "${ZSH_SOURCES}/options.zsh" "load_options"

		## load_my_pl10K_layout_now
		call_ source_prompt

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
			reload_path
			# echo "${BEGIN_HOURGLASS_END_0} READY in $(timer_all) ms !${END_FUNCTION}"
			hardcls
			# gnu_coreutils
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
}

into_zshrc-file() {
	export TIMER_ALL_THEN=$(/usr/bin/date +%s%N)
	#$ Verry first entry point
	## load_path
	export TERM="xterm-256color"
	export CLICOLOR='1'
	export LSCOLORS='GxFxCxDxBxDgedabagacad'
	export GPG_TT=(tty)
	. $HOME/.cache/path.env
	local TIMER_NOW=$(/usr/bin/date +%s%N)
	local TIMER_VALUE=$(((${TIMER_NOW} - ${TIMER_ALL_THEN}) / 1000000))
	echo "\u001b[1m      רֹוא יִהְי \u001b[0m"
	echo " ${TIMER_VALUE}   ms   to   'PATH'"

	export AHMYZSH="${HOME}/ahmyzsh"
	. "${AHMYZSH}/initial_load.zsh"
	# 'LET THERE BE LIGHT "יְהִי אוֹר" ... '
	lux_principium
	test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
}

into_zshrc-file-neb401() {
	#     #$ Verry first entry point
	# export TIMER_ALL_THEN=$(/bin/date +%s%N)
	# export TIMER_ALL_THEN=$(/usr/local/bin/gdate +%s%N)
	export TIMER_ALL_THEN=$(/usr/local/opt/coreutils/libexec/gnubin/date +%s%N)
	echo "\u001b[1m      רֹוא יִהְי \u001b[0m"

	export AHMYZSH="${HOME}/ahmyzsh"
	. "${AHMYZSH}/initial_load.zsh"
	__loader__

	# local TIMER_NOW=$(/bin/date +%s%N)
	load_zshenv
	# local TIMER_NOW=$(/usr/local/bin/gdate +%s%N)
	# local TIMER_VALUE=$(((${TIMER_NOW} - ${TIMER_ALL_THEN}) / 1000000))
	# echo " ${TIMER_VALUE}   ms"

}
