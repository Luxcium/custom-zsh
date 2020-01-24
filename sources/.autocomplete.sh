# echo "${BEGIN_LOADING} ${0} ${END_LOADING}"
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

function autocomplete() {
	# echo "${BEGIN_FUNCTION} 'autocomplete()' ${END_FUNCTION}"
	# # heroku autocomplete setup
	PATH_HEROKU_AC_ZSH_SETUP=/Users/neb_401/Library/Caches/heroku/autocomplete/zsh_setup && test -f $PATH_HEROKU_AC_ZSH_SETUP && source $PATH_HEROKU_AC_ZSH_SETUP

	# Load Zsh tools for syntax highlighting and autosuggestions
	HOMEBREW_FOLDER="/usr/local/share"
	source "$HOMEBREW_FOLDER/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
	source "$HOMEBREW_FOLDER/zsh-autosuggestions/zsh-autosuggestions.zsh"

	# The following lines were added by compinstall
	zstyle ':completion:*' completer _list _oldlist _expand _complete _ignored _match _correct _approximate _prefix
	zstyle ':completion:*' expand prefix
	zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:]}={[:upper:]}'
	zstyle :compinstall filename '/Users/neb_401/.zshrc'

	autoload -U +X compinit && compinit
	autoload -U +X bashcompinit && bashcompinit

	autoload -Uz compinit
	for dump in '~/.zcompdump(N.mh+24)'; do
		compinit
	done
	compinit -C

	# End of lines added for compinstall
	# autoload -U compinit && compinit
}
#
#
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
