## TODO: Duplicate CONSTANTS with ../functions/getvscodeportable.zsh \
##  should be set a part ...
(
  ## "CD DESTINSYION FOLDER" Sould not be hard coded
  cd /etc/vscode-portable/sources
  VSCODEURL_STABLE_RPM='https://go.microsoft.com/fwlink/?LinkID=760867'
  VSCODEURL_STABLE_TAR_GZ='https://go.microsoft.com/fwlink/?LinkID=620884'
  VSCODEURL_INSIDERS_RPM='https://go.microsoft.com/fwlink/?LinkID=760866'
  VSCODEURL_INSIDERS_TAR_GZ='https://go.microsoft.com/fwlink/?LinkId=723968'
  sudo nice -n -35 ionice -c 1 -n 0 curl -O -L -J -#S ${VSCODEURL_STABLE_RPM}
  sudo nice -n -35 ionice -c 1 -n 0 curl -O -L -J -#S ${VSCODEURL_STABLE_TAR_GZ}
  sudo nice -n -35 ionice -c 1 -n 0 curl -O -L -J -#S ${VSCODEURL_INSIDERS_RPM}
  sudo nice -n -35 ionice -c 1 -n 0 curl -O -L -J -#S ${VSCODEURL_INSIDERS_TAR_GZ}
  echo $(date +%C%y-%m-%d_%H-%M-%S_%s)
)
# ## UTILITY FUNCTIONS DEFINITIONS
# # † ======================================================================
# ## TODO: Duplicate CONSTANTS with ../functions/getvscodeportable.zsh \
# ##  should be set a part ...
# function RANDMX() {
#   rand1=$(sha224hmac <<<$(date +%s%N) | cut -c -${1} | tr \[a-z\] \[A-Z\])
#   echo -n "${rand1}"
#   exit 0
# }

# function LUXID() {
#   local myxuidhash="$(RANDMX 10)"
#   local myxuiddate="$(date +%C%y%m%d%H%M%S)$(date +%N | cut -c -3)"
#   local fooY="${myxuidhash}LXZ${myxuiddate}ID"
#   local fooZ="${fooY:0:1}${fooY:13:2}${fooY:1:1}${fooY:15:2}${fooY:2:1}${fooY:17:2}${fooY:3:1}${fooY:19:2}${fooY:4:1}${fooY:21:2}${fooY:5:1}${fooY:23:2}${fooY:6:1}${fooY:10:2}${fooY:30:2}${fooY:12:1}${fooY:7:1}${fooY:25:2}${fooY:8:1}${fooY:27:3}${fooY:9:1}"

#   echo -n $fooZ
#   exit 0
# }
# # ========================================================================

# ## INTERNAL VARIABLES DEFINITIONS
# # † ======================================================================
# ## TODO: Duplicate CONSTANTS with ../functions/getvscodeportable.zsh \
# ##  should be set a part ...
# myuxidlong="$(LUXID)"
# working_location="$(echo LXCM-vscode-$(date +%s)-${myuxidlong}-${vschannel} | tr \[a-z\] \[A-Z\])"
# working_location="/tmp/${working_location}"
# download_location="${working_location}/download"

#   # vschannel
#   # vscoderpm
#   # myuxidlong
#   # iamtheuser

#       ## CUSTOM VARIABLES DEFINITIONS
#       # † ======================================================================
#   ## TODO: Duplicate CONSTANTS with ../functions/getvscodeportable.zsh \
#   ##  should be set a part ...
#       vscoderpm="${VSCODEURL_STABLE_RPM}"
#       vscodeshortpath="${VSCODESHORTPATH_STABLE}"
#       vschannel="${VSCODESTABLECHANNEL}"

#       iamtheuser="$(whoami)"

#       ## vschannel="${1}" # 'STABLE' or 'INSIDERS'
#       if [[ "${1}" = 'INSIDERS' ]]; then
#         vschannel="${VSINSIDERSCHANNEL}"
#         vscoderpm="${VSCODEURL_INSIDERS_RPM}"
#         vscodeshortpath="${VSCODESHORTPATH_INSIDERS}"
#       else
#         vschannel="${VSCODESTABLECHANNEL}"
#         vscoderpm="${VSCODEURL_STABLE_RPM}"
#         vscodeshortpath="${VSCODESHORTPATH_STABLE}"
#       fi

# function get_stable_code_rpm() { (
#   # $///

# )}
# function get_stable_code_tar_gz() { (
#   # $///

# )}
# function get_insiders_code_rpm() { (
#   # $///

# )}
# function get_insiders_code_tar_gz() { (
#   # $///

# )}

# function get_vsc_from_msft (){

# }

#   # RHEL, Fedora, and CentOS based distributions openSUSE

#   ## DOWNLOAD FROM MICROSOFT
#   # † ======================================================================
#   cd ${download_location}

#   echo -e "\n >    download ${vschannel}.x86_64.rpm from microsoft server"
#   (sudo nice -n -35 ionice -c 1 -n 0 curl -O -L -J -S# "${vscoderpm}") || exit 1

#   myUXIDshort="$(date +%s)-${myuxidlong:7:11}L-${vschannel}"

#   cd ${working_location}

#   for f in $(ls ${download_location}/*code*.x86_64.rpm); do
#     (
#       sudo nice -n -35 ionice -c 1 -n 0 rpm2cpio "$f" |
#         sudo nice -n -35 ionice -c 1 -n 0 cpio -idm --no-absolute-filenames &>/dev/null
#     ) || exit 1
#   done

#   sudo nice -n -35 ionice -c 1 -n 0 chown -R ${iamtheuser} "${working_location}" >/dev/null

#   # ========================================================================
# ); }
