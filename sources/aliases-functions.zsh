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

function lsf() {
    echo ''
    pwd | lolcat
    colorls --almost-all --gs -f
    pwd | lolcat
    echo ''
}

function lsd() {
    echo ''
    pwd | lolcat
    colorls --all -d
    pwd | lolcat
    echo ''
}

function ll() {
    echo ''
    pwd | lolcat
    colorls -lA --sd --gs
    pwd | lolcat
    echo ''
}

function lf() {
    echo ''
    pwd | lolcat
    colorls -lA --sf -f
    pwd | lolcat
    echo ''
}

function ld() {
    echo ''
    pwd | lolcat
    colorls -lA --sd -d
    pwd | lolcat
    echo ''
}

function lc() {

    colorls -a --sd --gs -S
    pwd | lolcat -ta -d 5
    echo ''
}

function cls() {
    print "${clearall}"
    pwd | lolcat

}

function hardcls() {
    echo '\u001b[2J'
    echo '\u001b[0;0H'
}

function cd() {

    builtin cd $@
    echo ''
    pwd | lolcat
    colorls -lA --sd -d
    pwd | lolcat
    echo ''
}

# brew configurations

# function perseus() {
#     export WITH_ANACONDA=false
#     compute_path && echo "The sleeping Medusa decapitated."
# }

# function medusa() {
#     export WITH_ANACONDA=true
#     echo "Perseus  turning  to stone."
#     compute_path
# }

function brewdoc() {
    # FROM: (SOURCE) https://hashrocket.com/blog/posts/keep-anaconda-from-constricting-your-homebrew-installs
    # (C) 2018 HASHROCKET (used without permision)
    # perseus
    command echo '>     UPDATING BREW  . . . '
    command brew update
    command echo '>     UPGRADING BREW  . . . '
    command brew upgrade
    command echo '>     Remove old symlinks  . . . '
    command brew cleanup --prune-prefix
    command echo ">     If nothing is returned to the terminal you're up-to-date  . . . "
    command brew outdated
    command echo '>     List forumlas that can be cleaned up  . . . '
    command brew cleanup -n
    command echo '>     Remove all old formulae from brew and cask  . . . '
    command brew cleanup
    command echo '>     Show the individual packages installed  . . . '
    command brew list
    command echo '>     Looking if everything is working correctly  . . . '
    command brew doctor
    # command echo '>     Will also uninstall && reinstall all Globals NPM and PNPM  . . . '
    # reinstallNPMGlobal
    # medusa
}

function brew() {
    # perseus
    command brew "$@"
    # medusa
}

function brewx() {
    command brew "$@"
}

function ts-react-app() {
    npx create-react-app $1 --typescript
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
