function getportablecode() {
  (

    ## CONSTANTS
    {
      VSCODEURL_STABLE_RPM='https://go.microsoft.com/fwlink/?LinkID=760867'
      VSCODEURL_STABLE_TAR_GZ='https://go.microsoft.com/fwlink/?LinkID=620884'
      VSCODEURL_INSIDERS_RPM='https://go.microsoft.com/fwlink/?LinkID=760866'
      VSCODEURL_INSIDERS_TAR_GZ='https://go.microsoft.com/fwlink/?LinkId=723968'
      VSCODESHORTPATH_STABLE='code'
      VSCODESHORTPATH_INSIDERS='code-insiders'
      VSCODERPM="${VSCODEURL_STABLE_RPM}"
      VSCODESHORTPATH="${VSCODESHORTPATH_STABLE}"
    }

    ## CUSTOM VARIABLES
    {
      vsbranch="${1}" # 'STABLE' or 'INSIDERS'

      if [[ vsbranch = 'INSIDERS' ]]; then
        VSCODERPM="${VSCODEURL_INSIDERS_RPM}"
        VSCODESHORTPATH="${VSCODESHORTPATH_INSIDERS}"
      fi
    }

    function randmx() {
      rand1=$(sha224hmac <<<$(date +%s%N) | cut -c -${1} | tr \[a-z\] \[A-Z\])
      echo -n "${rand1}"
      exit 0
    }

    function luxid() {
      local myxuidhash="$(randmx 10)"
      local myxuiddate="$(date +%C%y%m%d%H%M%S)$(date +%N | cut -c -3)"
      local fooY="${myxuidhash}LXZ${myxuiddate}ID"
      local fooZ="${fooY:0:1}${fooY:13:2}${fooY:1:1}${fooY:15:2}${fooY:2:1}${fooY:17:2}${fooY:3:1}${fooY:19:2}${fooY:4:1}${fooY:21:2}${fooY:5:1}${fooY:23:2}${fooY:6:1}${fooY:10:2}${fooY:30:2}${fooY:12:1}${fooY:7:1}${fooY:25:2}${fooY:8:1}${fooY:27:3}${fooY:9:1}"

      echo -n $fooZ
      exit 0
    }

    ## INTERNAL VARIABLES
    {
      myUXIDlong="$(luxid)" || return 1
      WORKING_LOCATION="/tmp/LXCM-vscode-${vsbranch}-${myUXIDlong}" || return 1
      DOWNLOAD_LOCATION="${WORKING_LOCATION}/download" || return 1

      sudo nice -n -35 ionice -c 1 -n 1 mkdir -p "${DOWNLOAD_LOCATION}" || return 1
      sudo nice -n -35 ionice -c 1 -n 1 chown -R $(whoami) "${WORKING_LOCATION}" || return 1
    }

    ## DOWNLOAD FROM MICROSOFT
    {
      cd ${DOWNLOAD_LOCATION}

      echo -e "\n >    download ${vsbranch}.rpm from microsoft server"
      sudo nice -n -35 ionice -c 1 -n 1 curl -O -L -J -S# "${VSCODERPM}" || return 1
      myUXIDshort="${vsbranch}-$(date +%s)-${myUXIDlong:7:11}L" || return 1

      cd ${WORKING_LOCATION}
      for f in $(ls ${DOWNLOAD_LOCATION}/*code*.x86_64.rpm); do
        sudo nice -n -35 ionice -c 1 -n 1 rpm2cpio "$f" | sudo nice -n -35 ionice -c 1 -n 1 cpio -idm --no-absolute-filenames &>/dev/null || return 1
      done
      sudo nice -n -35 ionice -c 1 -n 1 chown -R $(whoami) "${WORKING_LOCATION}" >/dev/null || return 1
    }

    ## CREATING THE PORTABLE VERSION
    {
      cp -r "/etc/vscode-portable/vs-${VSCODESHORTPATH}/" "${WORKING_LOCATION}" || return 1
      mv "${WORKING_LOCATION}/usr/share/${VSCODESHORTPATH}" "${WORKING_LOCATION}/${VSCODESHORTPATH}" || return 1
      mkdir -p "${WORKING_LOCATION}/vs-${VSCODESHORTPATH}/completions/" || return 1

      # cp -r "${WORKING_LOCATION}/usr/share/zsh/site-functions/" "${WORKING_LOCATION}/vs-${VSCODESHORTPATH}/completions/zsh/" || return 1

      # cp -r "${WORKING_LOCATION}/usr/share/bash-completion/completions/" "${WORKING_LOCATION}/vs-${VSCODESHORTPATH}/completions/bash/" || return 1

      # cp -r "${WORKING_LOCATION}/usr/share/pixmaps/" "${WORKING_LOCATION}/vs-${VSCODESHORTPATH}/pixmaps/" || return 1

      for f in $(ls "${WORKING_LOCATION}/${VSCODESHORTPATH}"); do
        mv "${WORKING_LOCATION}/${VSCODESHORTPATH}/$f" "${WORKING_LOCATION}/vs-${VSCODESHORTPATH}/" || return 1
      done
    }

    ## MOVING STUFF TO HOME FOLDER
    {
      sudo mkdir -p "${HOME}/potable-vscode/" || return 1
      sudo nice -n -35 ionice -c 1 -n 1 chown -R $(whoami) "${WORKING_LOCATION}" || return 1
      sudo groupadd "luxcium.io" &>/dev/null
      sudo nice -n -35 ionice -c 1 -n 1 chgrp -R "luxcium.io" "${WORKING_LOCATION}" || return 1
      mv "${WORKING_LOCATION}/vs-${VSCODESHORTPATH}/" "${HOME}/potable-vscode/vs-code_${myUXIDshort}/" || return 1
      sudo rm -rf "${WORKING_LOCATION}" || return 1

    }

    echo "'${myUXIDshort}':"
    echo ${HOME}/potable-vscode/vs-code_${myUXIDshort}/
    echo ${HOME}/potable-vscode/vs-code_${myUXIDshort}/bin/code
    cd ${HOME}/potable-vscode/vs-code_${myUXIDshort}/ || return 1
  ) || return 1

  echo -e "\n   -OK-" && return 0
}
