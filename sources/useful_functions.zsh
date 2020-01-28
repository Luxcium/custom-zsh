function useful_functions() {
	# echo "${BEGIN_FUNCTION} 'useful_functions()' ${END_FUNCTION}"

	# Functions ==============================================

	# return 1 if global command line program installed, else 0
	# example
	# echo "node: $(program_is_installed node)"
	function program_is_installed() {
		# set to 1 initially
		local return_=1
		# set to 0 if not found
		type $1 >/dev/null 2>&1 || { local return_=0; }
		# return value
		echo "$return_"
	}

	# return 1 if local npm package is installed at ./node_modules, else 0
	# example
	# echo "gruntacular : $(npm_package_is_installed gruntacular)"
	function npm_package_is_installed() {
		# set to 1 initially
		local return_=1
		# set to 0 if not found
		ls node_modules | grep $1 >/dev/null 2>&1 || { local return_=0; }
		# return value
		echo "$return_"
	}

	# display a message in red with a cross by it
	# example
	# echo echo_fail "No"
	function echo_fail() {
		# echo first argument in red
		printf "\e[31m✘ ${1}"
		# reset colours back to normal
		printf "\033\e[0m"
	}

	# display a message in green with a tick by it
	# example
	# echo echo_fail "Yes"
	function echo_pass() {
		# echo first argument in green
		printf "\e[32m✔ ${1}"
		# reset colours back to normal
		printf "\033\e[0m"
	}

	# echo pass or fail
	# example
	# echo echo_if 1 "Passed"
	# echo echo_if 0 "Failed"
	function echo_if() {
		if [ $1 = 1 ]; then
			echo_pass $2
		else
			echo_fail $2
		fi
	}

	# ============================================== Functions

	# command line programs
	function versions() {
		printf "\033\e[0m"
		env echo "  $(echo_if $(program_is_installed node))  node $(env node -v)"
		env echo "  $(echo_if $(program_is_installed npm))  npm v$(env npm -v)"
		env echo "  $(echo_if $(program_is_installed fnm))  fnm v$(env fnm -v)"
		env echo "  $(echo_if $(program_is_installed yarn))  yarn v$(env yarn -v)"
		env echo "  $(echo_if $(program_is_installed pnpm))  pnpm v$(env pnpm -v)"
		env echo "  $(echo_if $(program_is_installed tmux))  $(env tmux -V)"
		env echo "  $(echo_if $(program_is_installed eslint))  eslint $(env eslint -v)"
		env echo "  $(echo_if $(program_is_installed tsc))  TypeScript $(env tsc -v)"
		env echo "  $(echo_if $(program_is_installed conda))  $(env conda -V)"
		env echo "  $(echo_if $(program_is_installed python))  $(env python -V)"
		env echo "  $(echo_if $(program_is_installed rbenv))  $(env rbenv -v)"
		env echo "  $(echo_if $(program_is_installed gem))  gem v$(env gem -v)"
		env echo "  $(echo_if $(program_is_installed ruby))  $(env ruby -v)"
		env echo "  $(echo_if $(program_is_installed brew))  $(env command brew -v)"
	}

	# echo "gulp    $(echo_if $(program_is_installed gulp))  "
	# echo "webpack $(echo_if $(program_is_installed webpack))  "
	# echo "conda $(echo_if $(program_is_installed conda))
	# echo "  $(echo_if $(program_is_installed redis))  redis"
	# echo "grep2   $(echo_if $(program_is_installed grep2))"

	# local npm packages
	# echo "lodash  $(echo_if $(npm_package_is_installed lodash))"
	# echo "react   $(echo_if $(npm_package_is_installed react))"
	# echo "angular $(echo_if $(npm_package_is_installed angular))"

	function eslint_global() {
		yarn global add install-peerdeps@latest eslint@latest
		install-peerdeps -Y -g eslint-config-airbnb-base@latest
		install-peerdeps -Y -g eslint@latest
		install-peerdeps -Y -g eslint-config-prettier@latest
		install-peerdeps -Y -g eslint-plugin-import@latest
		install-peerdeps -Y -g eslint-plugin-unicorn@latest
		install-peerdeps -Y -g @typescript-eslint/parser@latest
		install-peerdeps -Y -g @typescript-eslint/eslint-plugin
	}
	function update_npm() {
		( (npm i -g npm@latest yarn@latest pnpm@latest &) 2>/dev/null)
	}
	function zsh_version() {
		local ZSH_X=$(echo $0)
		local ZSH_V=$($(echo "${ZSH_X/'-'/}" --version))
		export MY_ZSH_VERSION=" ${TERM_ICO}  ${ZSH_V%%' (x86'*}"
		echo "${normal}$CLRLN$BYL9K_TERM$(tput setaf 2)${MY_ZSH_VERSION} ${BKBK}${normal}"
	}
}
