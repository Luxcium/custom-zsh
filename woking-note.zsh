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

# /bin/bash ~ The bash executable
# /etc/profile ~ The systemwide initialization file, executed for login shells
# ~/.bash_profile ~ The personal initialization file, executed for login shells
# ~/.bashrc ~ The individual per-interactive-shell startup file
# ~/.bash_logout ~ The individual login shell cleanup file, executed when a login shell exits
# ~/.inputrc ~ Individual readline initialization file

# You will also have these commands:
# imgcat filename
#   Displays the image inline.
# imgls
#   Shows a directory listing with image thumbnails.
# it2api
#   Command-line utility to manipulate iTerm2.
# it2attention start|stop|fireworks
#   Gets your attention.
# it2check
#   Checks if the terminal is iTerm2.
# it2copy [filename]
#   Copies to the pasteboard.
# it2dl filename
#   Downloads the specified file, saving it in your Downloads folder.
# it2setcolor ...
#   Changes individual color settings or loads a color preset.
# it2setkeylabel ...
#   Changes Touch Bar function key labels.
# it2ul
#   Uploads a file.
# it2universion
#   Sets the current unicode version.
