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

function npm_completion() {
  ###-begin-npm-completion-###
  #
  # npm command completion script
  #
  # Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
  # Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
  if type complete &>/dev/null; then
    _npm_completion() {
      local words cword
      if type _get_comp_words_by_ref &>/dev/null; then
        _get_comp_words_by_ref -n = -n @ -n : -w words -i cword
      else
        cword="$COMP_CWORD"
        words=("${COMP_WORDS[@]}")
      fi

      local si="$IFS"
      IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
        COMP_LINE="$COMP_LINE" \
        COMP_POINT="$COMP_POINT" \
        npm completion -- "${words[@]}" \
        2>/dev/null)) || return $?
      IFS="$si"
      if type __ltrim_colon_completions &>/dev/null; then
        __ltrim_colon_completions "${words[cword]}"
      fi
    }
    complete -o default -F _npm_completion npm
  elif type compdef &>/dev/null; then
    _npm_completion() {
      local si=$IFS
      compadd -- $(COMP_CWORD=$((CURRENT - 1)) \
        COMP_LINE=$BUFFER \
        COMP_POINT=0 \
        npm completion -- "${words[@]}" \
        2>/dev/null)
      IFS=$si
    }
    compdef _npm_completion npm
  elif type compctl &>/dev/null; then
    _npm_completion() {
      local cword line point words si
      read -Ac words
      read -cn cword
      let cword-=1
      read -l line
      read -ln point
      si="$IFS"
      IFS=$'\n' reply=($(COMP_CWORD="$cword" \
        COMP_LINE="$line" \
        COMP_POINT="$point" \
        npm completion -- "${words[@]}" \
        2>/dev/null)) || return $?
      IFS="$si"
    }
    compctl -K _npm_completion npm
  fi
  ###-end-npm-completion-###
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
