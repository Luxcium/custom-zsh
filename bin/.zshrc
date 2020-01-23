#! /usr/bin/env zsh
echo "${BEGIN_LOADING} ${0} ${END_LOADING}"
unsetopt PROMPT_SP
# echo -n "\u001b[0m\u001b[34m# LOADING... $0 \u001b[31;1m\n"

# echo -n "\u001b[0m\u001b[34m#\n  LOADING... (!!  USER   .zshrc)\u001b[31;1m\n"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/neb_401/anaconda3/tungsten/bin/conda' 'shell.zsh' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "${HOME}/anaconda3/tungsten/etc/profile.d/conda.sh" ]; then
        . "${HOME}/anaconda3/tungsten/etc/profile.d/conda.sh"
    else
        export PATH="${HOME}/anaconda3/tungsten/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# START FROM : {/etc/zshrc}
# Correctly display UTF-8 with combining characters.
if [ "$TERM_PROGRAM" = "Apple_Terminal" ]; then
    setopt combiningchars
fi
# disable log

[ -r "/etc/zshrc_$TERM_PROGRAM" ] && . "/etc/zshrc_$TERM_PROGRAM"
# END {/etc/zshrc}
ENV_LOADED='false'
source "${ZSH_LUXCIUM}/.source_all.sh"
source_all
