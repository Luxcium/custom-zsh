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

function load_other_code() {

	# LEFT_SUBSEGMENT_SEPARATOR=$'\uf292'

	# POWERLEVEL9K_CUSTOM_RIGHT="+%N:%i>"

	# Black: \u001b[30m
	# Red: \u001b[31m
	# Green: \u001b[32m
	# Yellow: \u001b[33m
	# Blue: \u001b[34m
	# Magenta: \u001b[35m
	# Cyan: \u001b[36m
	# White: \u001b[37m
	# Reset: \u001b[0m

	# Bright Black: \u001b[30;1m
	# Bright Red: \u001b[31;1m
	# Bright Green: \u001b[32;1m
	# Bright Yellow: \u001b[33;1m
	# Bright Blue: \u001b[34;1m
	# Bright Magenta: \u001b[35;1m
	# Bright Cyan: \u001b[36;1m
	# Bright White: \u001b[37;1m
	# Reset: \u001b[0m

	# Background Black: \u001b[40m
	# Background Red: \u001b[41m
	# Background Green: \u001b[42m
	# Background Yellow: \u001b[43m
	# Background Blue: \u001b[44m
	# Background Magenta: \u001b[45m
	# Background Cyan: \u001b[46m
	# Background White: \u001b[47m
	#
	# Background Bright Black: \u001b[40;1m
	# Background Bright Red: \u001b[41;1m
	# Background Bright Green: \u001b[42;1m
	# Background Bright Yellow: \u001b[43;1m
	# Background Bright Blue: \u001b[44;1m
	# Background Bright Magenta: \u001b[45;1m
	# Background Bright Cyan: \u001b[46;1m
	# Background Bright White: \u001b[47;1m

	# Bold: \u001b[1m
	# Underline: \u001b[4m
	# Reversed: \u001b[7m

	# Up: \u001b[{n}A
	# Down: \u001b[{n}B
	# Right: \u001b[{n}C
	# Left: \u001b[{n}D

	# Up: \u001b[{n}A moves cursor up by n
	# Down: \u001b[{n}B moves cursor down by n
	# Right: \u001b[{n}C moves cursor right by n
	# Left: \u001b[{n}D moves cursor left by n

	# Next Line: \u001b[{n}E moves cursor to beginning of line n lines down
	# Prev Line: \u001b[{n}F moves cursor to beginning of line n lines down
	# Set Column: \u001b[{n}G moves cursor to column n
	# Set Position: \u001b[{n};{m}H moves cursor to row n column m

	# Clear Screen: \u001b[{n}J clears the screen
	# n=0 clears from cursor until end of screen,
	# n=1 clears from cursor to beginning of screen
	# n=2 clears entire screen

	# Clear Line: \u001b[{n}K clears the current line
	# n=0 clears from cursor to end of line
	# n=1 clears from cursor to start of line
	# n=2 clears entire line

	# Save Position: \u001b[{s} saves the current cursor position
	# Save Position: \u001b[{u} restores the cursor to the last saved position

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
