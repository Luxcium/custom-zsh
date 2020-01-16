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

_node_complete() {
  local cur_word options
  cur_word="${COMP_WORDS[COMP_CWORD]}"
  if [[ "${cur_word}" == -* ]]; then
    COMPREPLY=($(compgen -W '--track-heap-objects --abort-on-uncaught-exception --napi-modules --redirect-warnings --max-old-space-size --perf-basic-prof --no-warnings --trace-event-file-pattern --check --preserve-symlinks --perf-prof --inspect-port --print --trace-deprecation --inspect-brk --expose_http2 --trace-sync-io --tls-cipher-list --no-force-async-hooks-checks --inspect --eval --loader --pending-deprecation --experimental-worker --expose-http2 --use-bundled-ca --stack-trace-limit --debug-brk --title --experimental-repl-await --debug --no-deprecation --use-openssl-ca --preserve-symlinks-main --interactive --inspect-brk-node --icu-data-dir --v8-options --expose-internals --trace-warnings --require --version --experimental-vm-modules --prof-process --max-http-header-size [has_eval_string] --throw-deprecation --completion-bash --help --zero-fill-buffers --v8-pool-size [ssl_openssl_cert_store] --experimental-modules --openssl-config --trace-event-categories --security-reverts --debug-port --prof-process --debug= -p -pe -v --inspect-brk= -i --print <arg> --inspect= --debug-brk= -e --inspect-brk-node= -c -h -r --trace-events-enabled' -- "${cur_word}"))
    return 0
  else
    COMPREPLY=($(compgen -f "${cur_word}"))
    return 0
  fi
}
# complete -F _node_complete node node_g

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
