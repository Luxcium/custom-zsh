# echo -n "\u001b[0m\u001b[34m# LOADING... $0 \u001b[31;1m\n"
################################################################################
##                                                                            ##
##              !!! PLEASE USE CAUTION WHEN USING THIS FILE !!!               ##
##                                                                            ##
##  THIS FILE CANNOT BE USED AS IS YOU MAY HAVE TO CUSTOMISE IT TO USE IT.    ##
##  Even if this file is shared on my public git hub it has not been designed ##
##  for public use. It was not created with the idea that someone else would  ##
##  be using it. The files in this repository have been created for my usage  ##
##  only. They are available so you can see how I have customized my system.  ##
##  I decided to put them in the public space so anyone can download them     ##
##  and edit them. I hope this can inspire someone or serve as a reference.   ##
##                                                                            ##
#+           Copyright (c) 2019-present Benjamin Vincent Kasapoglu            ##
#&                                                                            ##
#&     This Source Code Form is subject to the terms of the Mozilla Public    ##
#&     License, v. 2.0. If a copy of the MPL was not distributed with this    ##
#&           file, You can obtain one at http://mozilla.org/MPL/2.0/.         ##
#&                                                                            ##
##     The above copyright notice and this license notice shall be included   ##
##           in all copies or substantial portions of the Software.           ##
##                                                                            ##
################################################################################

function compute_p9k() {
	# echo 'function compute_p9k() '

	# if [ "$NODE_VERSION" != "$(cut -d 'v' -f 2 <<<$(node -v))" ]; then

	TS_ICON='$TS_ICO'
	TS_BG='blue'

	NODE_VERSION="$(cut -d 'v' -f 2 <<<$(node -v))"
	POWERLEVEL9K_CUSTOM_NODE="echo -n '\uf898 ' $NODE_VERSION"

	NPM_VERSION="$(npm -v)"
	POWERLEVEL9K_CUSTOM_NPM="echo -n '\ue71e ' $NPM_VERSION"

	# TS_VERSION="$(cut -d 'n' -f 2 <<<$(tsc -v))"

	# Customise the p9k prompts
	POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
		custom_js
		battery
		custom_node
		custom_npm
		custom_tsx
		newline # !!!
		os_icon
		user
		dir
		newline # !!!
		anaconda
		custom_js
		rbenv
		load
		dir_writable
		ssh
		status
		vcs
		custom_tsx
	)

	# fi

	POWERLEVEL9K_CUSTOM_NODE_FOREGROUND='black'
	POWERLEVEL9K_CUSTOM_NODE_BACKGROUND=$NODE_BG

	POWERLEVEL9K_CUSTOM_NPMR_FOREGROUND='black'
	POWERLEVEL9K_CUSTOM_NPMR_BACKGROUND=$NPM_BG

	POWERLEVEL9K_CUSTOM_NPM_FOREGROUND=$NPM_BG
	POWERLEVEL9K_CUSTOM_NPM_BACKGROUND='black'

	POWERLEVEL9K_CUSTOM_TS_FOREGROUND='black'
	POWERLEVEL9K_CUSTOM_TS_BACKGROUND=$TS_BG

	POWERLEVEL9K_CUSTOM_TSR_FOREGROUND=$TS_BG
	POWERLEVEL9K_CUSTOM_TSR_BACKGROUND='black'

	POWERLEVEL9K_CUSTOM_TSX="echo -n $TS_ICON "
	POWERLEVEL9K_CUSTOM_TSX_FOREGROUND='black'
	POWERLEVEL9K_CUSTOM_TSX_BACKGROUND=$TS_BG

	POWERLEVEL9K_NODE_VERSION_FOREGROUND='black'
	POWERLEVEL9K_NODE_VERSION_BACKGROUND='green'

}

p9k_load() {
	# echo 'function p9k_load() '

	TS_ICON=$'\uf071'
	JS_BG='yellow'
	JS_FG='black'
	NODE_BG='green'
	NODE_FG='black'
	NPM_BG='green'
	NPM_FG='black'
	TS_BG='yellow'
	TS_FG='black'

	POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
	POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=4
	POWERLEVEL9K_CUSTOM_JS="echo -n '\uf81d'"
	POWERLEVEL9K_CUSTOM_JS_FOREGROUND="$JS_FG"
	POWERLEVEL9K_CUSTOM_JS_BACKGROUND="$JS_BG"

	POWERLEVEL9K_RBENV_ALWAYS=true
	POWERLEVEL9K_RBENV_PROMPT_ALWAYS_SHOW=true
	POWERLEVEL9K_RBENV_FOREGROUND='red'
	POWERLEVEL9K_RBENV_BACKGROUND='black'

	POWERLEVEL9K_COLOR_SCHEME='dark'
	POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE=false
	POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE_ALWAYS=false

	POWERLEVEL9K_TIME_FORMAT='%D{%H:%M:%S}'
	POWERLEVEL9K_TIME_FOREGROUND='white'
	POWERLEVEL9K_TIME_BACKGROUND='black'

	POWERLEVEL9K_RPROMPT_ON_NEWLINE=false
	POWERLEVEL9K_PROMPT_ON_NEWLINE=false
	POWERLEVEL9K_PROMPT_ADD_NEWLINE=false

	# os_icon
	POWERLEVEL9K_OS_ICON_BACKGROUND='blue'
	POWERLEVEL9K_OS_ICON_FOREGROUND='black'

	# user - Default
	POWERLEVEL9K_USER_DEFAULT_ICON=$'\uF415'
	POWERLEVEL9K_USER_DEFAULT_FOREGROUND='008'
	POWERLEVEL9K_USER_DEFAULT_BACKGROUND='black'
	# user - ROOT
	POWERLEVEL9K_USER_ROOT_ICON=$'\uf292'
	POWERLEVEL9K_USER_ROOT_FOREGROUND='red'
	POWERLEVEL9K_USER_ROOT_BACKGROUND='black'
	# user - SUDO
	POWERLEVEL9K_USER_SUDO_ICON=$'\uF09C'
	POWERLEVEL9K_USER_SUDO_FOREGROUND='green'
	POWERLEVEL9K_USER_SUDO_BACKGROUND='black'
	# Other icons
	POWERLEVEL9K_DIR_HOME_ICON=$'\uf015'
	POWERLEVEL9K_DIR_HOME_SUBFOLDER_ICON=$'\uf115'
	POWERLEVEL9K_DIR_DEFAULT_ICON=$'\uf07c'
	POWERLEVEL9K_DIR_ETC_ICON=$'\uf085'
	# dir - HOME
	POWERLEVEL9K_DIR_HOME_BACKGROUND='blue'
	POWERLEVEL9K_DIR_HOME_FOREGROUND='black'
	# dir - HOME_SUBFOLDER
	POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='blue'
	POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='black'
	# dir - DEFAULT
	POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='blue'
	POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='black'
	# dir - ETC
	POWERLEVEL9K_DIR_ETC_BACKGROUND='blue'
	POWERLEVEL9K_DIR_ETC_FOREGROUND='black'

	# Create prompt section
	POWERLEVEL9K_CUSTOM_PROMPT='echo -n '.''
	POWERLEVEL9K_CUSTOM_PROMPT_BACKGROUND='blue'
	POWERLEVEL9K_CUSTOM_PROMPT_FOREGROUND='black'

	# Normal Disk Usage
	POWERLEVEL9K_DISK_USAGE_NORMAL_FOREGROUND='blue'
	POWERLEVEL9K_DISK_USAGE_NORMAL_BACKGROUND='black'

	# Disk Usage: Almost Full
	POWERLEVEL9K_DISK_USAGE_WARNING_LEVEL='87'
	POWERLEVEL9K_DISK_USAGE_WARNING_FOREGROUND='red'
	POWERLEVEL9K_DISK_USAGE_WARNING_BACKGROUND='black'

	# Disk Usage: Critically Full
	POWERLEVEL9K_DISK_USAGE_CRITICAL_LEVEL='92'
	POWERLEVEL9K_DISK_USAGE_CRITICAL_FOREGROUND='black'
	POWERLEVEL9K_DISK_USAGE_CRITICAL_BACKGROUND='red'

	POWERLEVEL9K_DISK_USAGE_NORMAL_ICON=$'\uf7c9'
	POWERLEVEL9K_DISK_USAGE_WARNING_ICON=$'\uf7c9'
	POWERLEVEL9K_DISK_USAGE_CRITICAL_ICON=$'\uf7c9'

	POWERLEVEL9K_DISK_USAGE_NORMAL_ICON_COLOR='blue'
	POWERLEVEL9K_DISK_USAGE_WARNING_ICON_COLOR='yellow'
	POWERLEVEL9K_DISK_USAGE_CRITICAL_ICON_COLOR='black'
	# Time
	POWERLEVEL9K_TIME_ICON_COLOR='008'
	POWERLEVEL9K_TIME_FOREGROUND='008'
	POWERLEVEL9K_TIME_BACKGROUND='black'

	# Customise the Powerlevel9k prompts
	POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
		custom_js
		battery
		custom_tsx
		newline # !!!
		os_icon
		user
		dir
		newline # !!!
		custom_js
		rbenv
		load
		dir_writable
		ssh
		status
		vcs
	)

	POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
		command_execution_time
		ram
		disk_usage
		custom_js
		background_jobs
	)

	# Load Nerd Fonts with Powerlevel9k theme for Zsh
	POWERLEVEL9K_MODE='nerdfont-complete'
}

##!!0###########################################################################
##!!                                                                          ##
#+!!         Copyright (c) 2019-present Benjamin Vincent Kasapoglu            ##
#&!!                                                                          ##
#&!!   This Source Code Form is subject to the terms of the Mozilla Public    ##
#&!!   License, v. 2.0. If a copy of the MPL was not distributed with this    ##
#&!!         file, You can obtain one at http://mozilla.org/MPL/2.0/.         ##
#&!!                                                                          ##
##!!   The above copyright notice and this license notice shall be included   ##
##!!         in all copies or substantial portions of the Software.           ##
##!!                                                                          ##
##!!          ------------------------------------------------------          ##
##!!                                                                          ##
##!!    Disclaimer of Warranty                                                ##
##!!   -------------------------                                              ##
##!!                                                                          ##
##!!   Covered Software is provided under this License on an "as is"          ##
##!!   basis, without warranty of any kind, either expressed, implied, or     ##
##!!   statutory, including, without limitation, warranties that the          ##
##!!   Covered Software is free of defects, merchantable, fit for a           ##
##!!   particular purpose or non-infringing. The entire risk as to the        ##
##!!   quality and performance of the Covered Software is with You.           ##
##!!   Should any Covered Software prove defective in any respect, You        ##
##!!   (not any Contributor) assume the cost of any necessary servicing,      ##
##!!   repair, or correction. This disclaimer of warranty constitutes an      ##
##!!   essential part of this License. No use of any Covered Software is      ##
##!!   authorized under this License except under this disclaimer.            ##
##!!                                                                          ##
##!!0###########################################################################
