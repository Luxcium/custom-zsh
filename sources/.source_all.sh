echo "${BEGIN_LOADING} ${0} ${END_LOADING}"
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

function source_less() {
	echo "${BEGIN_FUNCTION} 'source_less()' ${END_FUNCTION}"

	source "${ZSH_LUXCIUM}/.compute_path.sh"
	load_paths

	source "${PATH_ZSH_FLAGS}/flg-shortcuts.sh"
	source "${PATH_ZSH_FUNCTIONS}/editallzprofiles.zsh"
	source "${PATH_ZSH_FUNCTIONS}/load_compute_p9k.zsh"
	source "${PATH_ZSH_FUNCTIONS}/load_oh_my_zsh.zsh"
	source "${ZSH_LUXCIUM}/.autocomplete.sh"
	source "${ZSH_LUXCIUM}/completion/node_bash_completion.sh"
	source "${ZSH_LUXCIUM}/completion/npm.completion.sh"
}

function source_zsh() {
	echo "${BEGIN_FUNCTION} 'source_zsh()' ${END_FUNCTION}"

	# echo '\u001b[0m\u001b[34m# FUNCTION.. >source_zsh() \u001b[31;1m'
	source_less

	setopt appendhistory
	setopt autocd
	setopt beep
	bindkey -e

	HISTFILE="${HOME}/.zsh_history"
	HISTSIZE=1000000
	SAVEHIST=1000000
	setopt BANG_HIST              # Treat the '!' character specially during expansion.
	setopt EXTENDED_HISTORY       # Write the history file in the ":start:elapsed;command" format.
	setopt INC_APPEND_HISTORY     # Write to the history file immediately, not when the shell exits.
	setopt SHARE_HISTORY          # Share history between all sessions.
	setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first when trimming history.
	setopt HIST_IGNORE_DUPS       # Don't record an entry that was just recorded again.
	setopt HIST_IGNORE_ALL_DUPS   # Delete old recorded entry if new entry is a duplicate.
	setopt HIST_FIND_NO_DUPS      # Do not display a line previously found.
	setopt HIST_IGNORE_SPACE      # Don't record an entry starting with a space.
	setopt HIST_SAVE_NO_DUPS      # Don't write duplicate entries in the history file.
	setopt HIST_REDUCE_BLANKS     # Remove superfluous blanks before recording entry.
	setopt HIST_VERIFY            # Don't execute immediately upon history expansion.
	setopt HIST_BEEP
}

alias renew='resource_all'
function source_all() {
	echo "${BEGIN_FUNCTION} 'source_all()' ${END_FUNCTION}"
	# echo '\u001b[0m\u001b[34m# FUNCTION.. >source_all() \u001b[31;1m'

	source_zsh
	npm_completion
	load_layouts

	source "${PATH_ZSH_FUNCTIONS}/precmd.zsh"

	export PYTHONSTARTUP="${HOME}/.pythonrc"

	source $PATH_TMUX_BIN/tmux-functions.sh
	# spectrum
	function resource_all() {
		source "${ZSH_LUXCIUM}/.source_all.sh"
		source_all
		source "${MY_ALIASES}"
		load_aliases
	}

}
