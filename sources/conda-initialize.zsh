: ${CONDA_PATH:="${HOME}/anaconda3/titanio"}

function conda_init() {

    if [ -x /usr/libexec/path_helper ]; then
        eval $(/usr/libexec/path_helper -s)
    fi
    {
        { #& >>> conda initialize >>>
            # !! Contents within this block are managed by 'conda init' !!
            local __conda_setup=$("${CONDA_PATH}/bin/conda" "shell.bash" "hook" 2>/dev/null)
            if [ $? -eq 0 ]; then
                eval "${__conda_setup}"
            else
                if [ -f "${CONDA_PATH}/etc/profile.d/conda.sh" ]; then
                    . "${CONDA_PATH}/etc/profile.d/conda.sh"
                else
                    export PATH="${CONDA_PATH}/bin:${PATH}"
                fi
            fi
            conda activate
            unset __conda_setup
        } #& <<< conda initialize <<<

    }

}

function Xconda_init() {

    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    local __conda_setup=$("${CONDA_PATH}/bin/conda" "shell.bash" "hook" 2>/dev/null)
    if [ $? -eq 0 ]; then
        eval "${__conda_setup}"
    else
        if [ -f "${CONDA_PATH}/etc/profile.d/conda.sh" ]; then
            . "${CONDA_PATH}/etc/profile.d/conda.sh"
        else
            export PATH="${CONDA_PATH}/bin:${PATH}"
        fi
    fi
    # <<< conda initialize <<<

}
