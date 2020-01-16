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

	source "${ZSH_LUXCIUM}/.aliases.sh"
	load_aliases

	source "${ZSH_LUXCIUM}/.compute_path.sh"
	load_paths

	source "${PATH_ZSH_FLAGS}/flg-shortcuts.sh"
	source "${PATH_ZSH_FUNCTIONS}/aliases-functions.zsh"
	source "${PATH_ZSH_FUNCTIONS}/editallzprofiles.zsh"
	source "${PATH_ZSH_FUNCTIONS}/load_compute_p9k.zsh"
	source "${PATH_ZSH_FUNCTIONS}/load_oh_my_zsh.zsh"
	source "${ZSH_LUXCIUM}/.autocomplete.sh"
	source "${ZSH_LUXCIUM}/completion/node_bash_completion.sh"
	source "${ZSH_LUXCIUM}/completion/npm.completion.sh"
	source "${PATH_ZSH_FUNCTIONS}/useful_function.sh"
}

function source_zsh() {
	source_less

	setopt appendhistory
	setopt autocd
	setopt beep
	bindkey -e

	HISTFILE="/Users/neb_401/.zsh_history"
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
	source_zsh

	npm_completion
	load_layouts

	source "${PATH_ZSH_FUNCTIONS}/precmd.zsh"

	export PYTHONSTARTUP="/Users/neb_401/.pythonrc"

	source $PATH_TMUX_BIN/tmux-functions.sh
	# spectrum
	function resource_all() {
		source "${ZSH_LUXCIUM}/.source_all.sh"
		source_all
	}

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
