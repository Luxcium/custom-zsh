function conda_init() {

    if [ -x /usr/libexec/path_helper ]; then
        eval $(/usr/libexec/path_helper -s)
    fi
    {
        { #& >>> conda initialize >>>
            # !! Contents within this block are managed by 'conda init' !!
            # __conda_setup="$('/Users/neb_401/anaconda3/tungsten/bin/conda' 'shell.zsh' 'hook' 2>/dev/null)"
            # if [ $? -eq 0 ]; then
            # eval "$__conda_setup"
            # else
            if [ -f "${HOME}/anaconda3/tungsten/etc/profile.d/conda.sh" ]; then
                . "${HOME}/anaconda3/tungsten/etc/profile.d/conda.sh"
            else
                export PATH="${HOME}/anaconda3/tungsten/bin:$PATH"
            fi
            # fi
            conda activate
            unset __conda_setup
        } #& <<< conda initialize <<<

    }

}
