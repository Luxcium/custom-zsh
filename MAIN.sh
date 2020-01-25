function load_zshenv() {
	echo "${BEGIN_FUNCTION} 'load_zshenv()' ${END_FUNCTION}"
	# if [ "$LOAD_LATER" != 'true' ]; then
	load_all_aliases
	# fi
	# source_env
	load_paths
	compute_path

}

function load_zprofile() {
	echo "${BEGIN_FUNCTION} 'load_zprofile()' ${END_FUNCTION}"

}

function load_zshrc() {
	echo "${BEGIN_FUNCTION} 'load_zshrc()' ${END_FUNCTION}"
	# if [ "$LOAD_LATER" != 'true' ]; then
	load_oh_my_zsh
	load_later
	# fi
	source_options
}

function load_zlogin() {
	echo "${BEGIN_FUNCTION} 'load_zlogin()' ${END_FUNCTION}"

}

function load_zlogout() {
	# echo "${BEGIN_FUNCTION} 'load_zlogout()' ${END_FUNCTION}"
	say_bye_alex
	hardcls
}
function precmd() {
	if [ "$ENV_LOADED" != 'true' ]; then
		ENV_LOADED='true'
		p9k_load
		hardcls
		gnu_coreutils
		export LOAD_LATER=true
	fi
	compute_p9k
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
