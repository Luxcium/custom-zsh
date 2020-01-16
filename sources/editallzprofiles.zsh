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

alias editsystems='editsystem_zsh'
alias editusers='edituser_zsh'
alias editcustoms='editcustom_zsh'
alias editallz='editall_zsh'
alias zshenvs='edit_zshenv'
alias zprofiles='edit_zprofile'
alias zshrcs='edit_zshrc'
alias zlogins='edit_zlogin'
alias zlogouts='edit_zlogout'
alias editallb='editallbprofiles'
alias editallbz='editallbprofiles;editallzprofiles'
alias editallzb='editallbz'

function editrc() {
    echo ''
    echo 'editallz'
    echo 'editallb'
    echo ''
    echo 'editsystems'
    echo 'editusers'
    echo 'editcustoms'
    echo ''
    echo 'zshenvs'
    echo 'zprofiles'
    echo 'zshrcs'
    echo 'zlogins'
    echo 'zlogouts'
    echo ''
    echo 'editallbz or editallzb'
    echo ''
}
function editsystem_zsh() {

    sudo code -n '/etc/zshenv'
    sudo code -r '/etc/zprofile'
    sudo code -r '/etc/zshrc'
    sudo code -r '/etc/zlogin'
    sudo code -r '/etc/zlogout'

}

function edituser_zsh() {

    sudo code -r "${HOME}/.zshenv"
    sudo code -r "${HOME}/.zprofile"
    sudo code -r "${HOME}/.zshrc"
    sudo code -r "${HOME}/.zlogin"
    sudo code -r "${HOME}/.zlogout"

}

function editcustom_zsh() {

    sudo code -r "${ZSH_BIN}/.zshenv"
    sudo code -r "${ZSH_BIN}/.zprofile"
    sudo code -r "${ZSH_BIN}/.zshrc"
    sudo code -r "${ZSH_BIN}/.zlogin"
    sudo code -r "${ZSH_BIN}/.zlogout"

}
function editall_zsh() {

    sudo code -n '/etc/zshenv'
    sudo code -r '/etc/zprofile'
    sudo code -r '/etc/zshrc'
    sudo code -r '/etc/zlogin'
    sudo code -r '/etc/zlogout'
    sudo code -r "${HOME}/.zshenv"
    sudo code -r "${HOME}/.zprofile"
    sudo code -r "${HOME}/.zshrc"
    sudo code -r "${HOME}/.zlogin"
    sudo code -r "${HOME}/.zlogout"
    sudo code -r "${ZSH_BIN}/.zshenv"
    sudo code -r "${ZSH_BIN}/.zprofile"
    sudo code -r "${ZSH_BIN}/.zshrc"
    sudo code -r "${ZSH_BIN}/.zlogin"
    sudo code -r "${ZSH_BIN}/.zlogout"

}

function edit_zshenv() {
    sudo code -n '/etc/zshenv'
    sudo code -r "${HOME}/.zshenv"
    sudo code -r "${ZSH_BIN}/.zshenv"
}
function edit_zprofile() {

    sudo code -r '/etc/zprofile'
    sudo code -r "${HOME}/.zprofile"
    sudo code -r "${ZSH_BIN}/.zprofile"
}
function edit_zshrc() {
    sudo code -r '/etc/zshrc'
    sudo code -r "${HOME}/.zshrc"
    sudo code -r "${ZSH_BIN}/.zshrc"
}
function edit_zlogin() {
    sudo code -r '/etc/zlogin'
    sudo code -r "${HOME}/.zlogin"
    sudo code -r "${ZSH_BIN}/.zlogin"
}
function edit_zlogout() {
    sudo code -r '/etc/zlogout'
    sudo code -r "${HOME}/.zlogout"
    sudo code -r "${ZSH_BIN}/.zlogout"
}

function editallbprofiles() {

    # The systemwide initialization file, executed for login shells
    sudo code -r '/etc/profile'
    # The personal initialization file, executed for login shells
    sudo code -r "${HOME}/.bash_profile"
    # The individual per-interactive-shell startup file
    sudo code -r "${HOME}/.bashrc"
    # The individual login shell cleanup file, executed when a login shell exits
    sudo code -r "${HOME}/.bash_logout"
    # Individual readline initialization file
    sudo code -r "${HOME}/.inputrc"

    sudo code -r "${ZSH_BIN}/bash/profile"
    sudo code -r "${ZSH_BIN}/bash/.bash_profile"
    sudo code -r "${ZSH_BIN}/bash/.bashrc"
    sudo code -r "${ZSH_BIN}/bash/.bash_logout"
    sudo code -r "${ZSH_BIN}/bash/.inputrc"

}

# source_less

# Visual Studio Code 1.39.2
# Usage: code [options][paths...]

# To read from stdin, append '-' (e.g. 'ps aux | grep code | code -')

# Options
#   -d --diff <file> <file>           Compare two files with each other.
#   -a --add <folder>                 Add folder(s) to the last active window.
#   -g --goto <file:line[:character]> Open a file at the path on the specified line and character
#                                     position.
#   -n --new-window                   Force to open a new window.
#   -r --reuse-window                 Force to open a file or folder in an already opened window.
#   -w --wait                         Wait for the files to be closed before returning.
#   --locale <locale>                 The locale to use (e.g. en-US or zh-TW).
#   --user-data-dir <dir>             Specifies the directory that user data is kept in. Can be used
#                                     to open multiple distinct instances of Code.
#   -v --version                      Print version.
#   -h --help                         Print usage.
#   --telemetry                       Shows all telemetry events which VS code collects.
#   --folder-uri <uri>                Opens a window with given folder uri(s)
#   --file-uri <uri>                  Opens a window with given file uri(s)

# Extensions Management
#   --extensions-dir <dir>                            Set the root path for extensions.
#   --list-extensions                                 List the installed extensions.
#   --show-versions                                   Show versions of installed extensions, when
#                                                     using --list-extension.
#   --category                                        Filters installed extensions by provided
#                                                     category, when using --list-extension.
#   --install-extension <extension-id | path-to-vsix> Installs or updates the extension. Use
#                                                     `--force` argument to avoid prompts.
#   --uninstall-extension <extension-id>              Uninstalls an extension.
#   --enable-proposed-api <extension-id>              Enables proposed API features for extensions.
#                                                     Can receive one or more extension IDs to
#                                                     enable individually.

# Troubleshooting
#   --verbose                          Print verbose output (implies --wait).
#   --log <level>                      Log level to use. Default is 'info'. Allowed values are
#                                      'critical', 'error', 'warn', 'info', 'debug', 'trace',
#                                      'off'.
#   -s --status                        Print process usage and diagnostics information.
#   --prof-startup                     Run CPU profiler during startup
#   --disable-extensions               Disable all installed extensions.
#   --disable-extension <extension-id> Disable an extension.
#   --inspect-extensions <port>        Allow debugging and profiling of extensions. Check the
#                                      developer tools for the connection URI.
#   --inspect-brk-extensions <port>    Allow debugging and profiling of extensions with the extension
#                                      host being paused after start. Check the developer tools for
#                                      the connection URI.
#   --disable-gpu                      Disable GPU hardware acceleration.
#   --max-memory                       Max memory size for a window (in Mbytes).

# LOADING... (!   SYSTEM ! zshenv)
# LOADING... (!!! CUSTOM .zshenv)
# LOADING... (*   SH-SYSTEM profile)
# LOADING... (!!  USER .zshenv)
# LOADING... (!   SYSTEM ! zprofile)
# LOADING... (!!  USER .zprofile)
# LOADING... (!!! CUSTOM .zprofile)
# LOADING... (!   SYSTEM ! zshrc)
# LOADING... (!!  USER .zshrc)
# LOADING... (!!! CUSTOM .zshrc)
#      LOADING!.. load_oh_my_zsh()tmx
#      GNU/Linux utils are in function
# LOADING... (!   SYSTEM ! zlogin)
# LOADING... (!!  USER .zlogin)
# LOADING... (!!! CUSTOM .zlogin)

# export ZSH="${HOME}/.oh-my-zsh"
# export ZSH_CUSTOM="${ZSH}/custom"
# export ZSH_LUXCIUM="${ZSH_CUSTOM}/luxcium"
# export ZSH_BIN="${ZSH_LUXCIUM}/bin"
# export BASH_BIN="${ZSH_BIN}/bash"
# source "${ZSH_BIN}/.zshenv"

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
