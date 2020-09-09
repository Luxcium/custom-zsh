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

function load_zshenv() {
	#   #$ Interactive,Script,login,non-login

	## load_path_now
	call_ load_path

	## load_functions_now
	load_ "${ZSH_SOURCES}/functions.zsh" "load_functions_definitions"
	# source_ "${ZSH_FUNCTIONS_FOLDER}/getportablecode.sh"
	source_ "${ZSH_FUNCTIONS_FOLDER}/getvscodeportable.zsh"

	## load_aliases_now
	export MY_ALIASES="${CUSTOM_ZSH}/aliases.sh"
	load_ "${MY_ALIASES}" "load_aliases"

	[ "${VERBOSA}" -gt 0 ] && echo "${BEGIN_HOURGLASS_END_1} load_zshenv in $(timer_all) ms !${END_FUNCTION}"
}

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

function precmd() {

	#   #$ Executed before each prompt. Note that precommandfunctions are not
	#   #$ re-executed simply because the command line is redrawn, as happens, for
	#   #$ example, when a notification about an exiting job is displayed.

	if [ "$ENV_LOADED" != 'true' ]; then
		export PARENT_ENV_LOADED='true'
		ENV_LOADED='true'

		right_prompt_off
		# hardcls
		echo -n "  ${BEGIN_HOURGLASS_END_1} READY in $(timer_all) ms !${END_FUNCTION}"
		echo -e "\a"
		echo -n "\e[30m   # >\e[30m\e[31m\n"
		echo -n "\e[30m   # \e[38;2;55;118;171m>  $(python -V) \u001b[31m\n"
		# echo -n "\e[30m   # >\e[30m\e[31m\n"
		echo -n "\e[30m   # \e[38;2;51;153;51m>  Node: $(node -v) \u001b[31m\n"
		echo -n "\e[30m   # \e[38;2;203;56;55m>  NPM: $(npm -v) \u001b[31m\n"
		echo -n "\e[30m   # \e[38;2;44;142;187m>  Yarn: $(yarn -v) \u001b[31m\n"
		echo -n "\e[30m   # \e[38;2;0;122;204m>  TSC: $(tsc -v) \u001b[31m\n"
		# echo -n "\e[30m   # >\e[30m\e[31m\n"
		echo -n "\e[30m   # \e[38;2;252;198;36m>  $(uname): $(uname -r) \u001b[31m\n"
		echo -n "\e[30m   # \e[37m>  $(zsh --version | grep zsh) \u001b[31m\n"
		echo -n "\u001b[37m\n"
	fi
}

function load_zlogout() {
	##$ Interactive,login
	echo -en "\u001b[1A"
	echo -en "\e[38;2;252;198;36m| . . . . . . B  '102\%' |          \u001b[1000D"
	sleep 0.1
	echo -en "\e[38;2;252;198;36m|    . . . . .BY ' 92\%' |          \u001b[1000D"
	sleep 0.1
	echo -en "\e[38;2;252;198;36m|    . . . . BYE ' 82\%' |          \u001b[1000D"
	sleep 0.1
	echo -en "\e[38;2;252;198;36m|      . . .BYE  ' 78\%' |          \u001b[1000D"
	_p9k_dump_instant_prompt 2>/dev/null
	echo -en "\e[38;2;252;198;36m|      . . BYE ! ' 66\%' |          \u001b[1000D"
	compute_path 2>/dev/null
	echo -en "\e[38;2;252;198;36m|        .BYE !  ' 54\%' |          \u001b[1000D"
	zsh_compile_all_R 2>/dev/null
	echo -en "\e[38;2;252;198;36m|        BYE !   ' 42\%' |          \u001b[1000D"
	sleep 0.1
	echo -en "\e[38;2;252;198;36m|       BYE !    ' 32\%' |          \u001b[1000D"
	sleep 0.1
	echo -en "\e[38;2;252;198;36m|      BYE !     ' 22\%' |          \u001b[1000D"
	sleep 0.1
	echo -en "\e[38;2;252;198;36m|    B YE !      ' 12\%' |          \u001b[1000D"
	sleep 0.1
	echo -en "\e[38;2;252;198;36m| Y  E !         ' 12\%' |          \u001b[1000D"
	sleep 0.1
	echo -en "\e[38;2;252;198;36m| !              '  2\%' |          \u001b[1000D"
	sleep 0.1
}
#      \u001b[1000D
# Up: \u001b[{n}A
# Down: \u001b[{n}B
# Right: \u001b[{n}C
# Left: \u001b[{n}D

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
# |~/.zshrc        |    F      |    D      |      |
# |/etc/zlogin     |    G      |           |      |
# |~/.zlogin       |    H      |           |      |
# |                |           |           |      |
# |                |           |           |      |
# |~/.zlogout      |    I      |           |      |
# |/etc/zlogout    |    J      |           |      |
# |----------------|-----------|-----------|------|
