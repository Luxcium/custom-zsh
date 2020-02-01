function source_all() {
	# if [ "$LOAD_ONCE_01" != 'true' ]; then

	echo "${BEGIN_FUNCTION} 'source_all()' ${END_FUNCTION}"

	S1="${ZSH_SOURCES}/functions.zsh"
	echo "${BEGIN_LOADING} ${S1} ${END_LOADING}"
	. "${S1}"

	# if [ "$LOAD_ONCE_01_A" != 'true' ]; then
	S1="${ZSH_SOURCES}/load-oh-my-zsh.zsh"
	echo "${BEGIN_LOADING} ${S1} ${END_LOADING}"
	. "${S1}"
	# fi
	# if [ "$LOAD_ONCE_01_B" != 'true' ]; then
	S1="${POWERLINE_BINDINGS}/zsh/powerline.zsh"
	echo "${BEGIN_LOADING} ${S1} ${END_LOADING}"
	. "${S1}"
	# fi
	# if [ "$LOAD_ONCE_01_C" != 'true' ]; then
	S1="${POWERLEVEL10K}/powerlevel10k.zsh-theme"
	echo "${BEGIN_LOADING} ${S1} ${END_LOADING}"
	. "${S1}"
	# fi
	# if [ "$LOAD_ONCE_01_D" != 'true' ]; then
	S1="${ZSH_LAYOUTS}/pl10K-Layout.zsh"
	echo "${BEGIN_LOADING} ${S1} ${END_LOADING}"
	. "${S1}"
	# fi
	# if [ "$LOAD_ONCE_01_E" != 'true' ]; then
	S1="${ZSH_SOURCES}/say-bye.zsh"
	echo "${BEGIN_LOADING} ${S1} ${END_LOADING}"
	. "${S1}"
	# fi
	# if [ "$LOAD_ONCE_01_F" != 'true' ]; then
	S1="${ZSH_SOURCES}/useful_functions.zsh"
	echo "${BEGIN_LOADING} ${S1} ${END_LOADING}"
	. "${S1}"
	# fi
	# if [ "$LOAD_ONCE_01_G" != 'true' ]; then
	S1="${ZSH_COMPLETION}/autocomplete.sh"
	echo "${BEGIN_LOADING} ${S1} ${END_LOADING}"
	. "${S1}"
	# fi
	# if [ "$LOAD_ONCE_01_H" != 'true' ]; then
	S1="${ZSH_COMPUTE}/path.zsh"
	echo "${BEGIN_LOADING} ${S1} ${END_LOADING}"
	. "${S1}"
	# fi
	# if [ "$LOAD_ONCE_01_I" != 'true' ]; then
	S1="${ZSH_SOURCES}/options.zsh"
	echo "${BEGIN_LOADING} ${S1} ${END_LOADING}"
	. "${S1}"
	# fi
	# if [ "$LOAD_ONCE_01_J" != 'true' ]; then
	S1="${ZSH_FLAGS}/flg-shortcuts.sh"
	echo "${BEGIN_LOADING} ${S1} ${END_LOADING}"
	. "${S1}"
	# fi
	# if [ "$LOAD_ONCE_01_H" != 'true' ]; then
	S1="${TMUX_LOADER}"
	echo "${BEGIN_LOADING} ${S1} ${END_LOADING}"
	. "${S1}"
	# fi
	# fi
	# sleep 100

}

function load_zshenv() {
	# if [ "$LOAD_ONCE_02" != 'true' ]; then
	echo "${BEGIN_FUNCTION} 'load_zshenv()' ${END_FUNCTION}"
	#$ Interactive,Script,login,non-login

	compute_path
	# load_functions_definitions

	# if [ "$LOAD_LATER" != 'true' ]; then
	# fi
	# echo compute_path
	# fi
}

function load_zprofile() {
	# if [ "$LOAD_ONCE_ZPROFILE" != 'true' ]; then
	echo "${BEGIN_FUNCTION} 'load_zprofile()' ${END_FUNCTION}"
	#$ Interactive,login
	# fi
}

function load_zshrc() {
	# if [ "$LOAD_ONCE_04" != 'true' ]; then
	echo "${BEGIN_FUNCTION} 'load_zshrc()' ${END_FUNCTION}"
	#$ Interactive,login,non-login

	load_oh_my_zsh
	load_options
	autocomplete
	load_tmux
	useful_functions
	# fi

	load_pl10K
	compute_pl10k

}

function load_zlogin() {
	# if [ "$LOAD_ONCE_05" != 'true' ]; then
	echo "${BEGIN_FUNCTION} 'load_zlogin()' ${END_FUNCTION}"
	#$ Interactive,login
	# fi

}

function load_zlogout() {
	# if [ "$LOAD_ONCE_06" != 'true' ]; then

	echo "${BEGIN_FUNCTION} 'load_zlogout()' ${END_FUNCTION}"
	#$ Interactive,login
	# say_bye_tom
	hardcls
	# fi
}
function precmd() {
	# if [ "$LOAD_ONCE_07" != 'true' ]; then
	# export LOAD_ONCE_01='true'
	{
		# export LOAD_ONCE_01_A='true' # "${ZSH_SOURCES}/load-oh-my-zsh.zsh"
		# export LOAD_ONCE_01_B='true' # "${POWERLINE_BINDINGS}/zsh/powerline.zsh"
		# export LOAD_ONCE_01_C='true' # "${POWERLEVEL10K}/powerlevel10k.zsh-theme"
		# export LOAD_ONCE_01_D='true' # "${ZSH_LAYOUTS}/pl10K-Layout.zsh"
		# export LOAD_ONCE_01_E='true' # "${ZSH_SOURCES}/say-bye.zsh"
		# export LOAD_ONCE_01_F='true' # "${ZSH_SOURCES}/useful_functions.zsh"
		# export LOAD_ONCE_01_G='true' # "${ZSH_COMPLETION}/autocomplete.sh"
		# export LOAD_ONCE_01_H='true' # "${ZSH_COMPUTE}/path.zsh"
		# export LOAD_ONCE_01_I='true' # "${ZSH_SOURCES}/options.zsh"
		# export LOAD_ONCE_01_J='true' # "${ZSH_FLAGS}/flg-shortcuts.sh"
	}
	# export LOAD_ONCE_02='true'
	# export LOAD_ONCE_ZPROFILE='true'
	# export LOAD_ONCE_04='true'
	# export LOAD_ONCE_05='true'
	# export LOAD_ONCE_06='true'
	# export LOAD_ONCE_07='true'
	#$ Executed before each prompt. Note that precommand functions are not
	#$ re-executed simply because the command line is redrawn, as happens, for
	#$ example, when a notification about an exiting job is displayed.

	if [ "$ENV_LOADED" != 'true' ]; then
		ENV_LOADED='true'
		hardcls
		gnu_coreutils

		export LOAD_LATER='true'
	fi
	if [ "$NODE_VERSION" != "$(cut -d 'v' -f 2 <<<$(node -v))" ]; then
		compute_pl10k
	fi
	# fi

	#
	# exit

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
