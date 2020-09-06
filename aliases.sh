export ALIASES_FOLDER="${CUSTOM_ZSH}/sources/aliases"
export ALIASES_FEDORA_FOLDER="${ALIASES_FOLDER}/fedora"
source_ "${ALIASES_FEDORA_FOLDER}/bells.sh"
source_ "${ALIASES_FOLDER}/aliases.sh"
source_ "${ALIASES_FOLDER}/for-do.sh"
source_ "${ALIASES_FOLDER}/dnf.sh"
ZSH_LOVERS

alias rnd4='echo $(sha224hmac <<< $(date +%s%N) | cut -c -4 | tr \[a-z\] \[A-Z\])'
alias rnd6='echo $(sha224hmac <<< $(date +%s%N) | cut -c -6 | tr \[a-z\] \[A-Z\])'
alias rnd8='echo $(sha224hmac <<< $(date +%s%N) | cut -c -8 | tr \[a-z\] \[A-Z\])'
alias rnd16='echo $(sha224hmac <<< $(date +%s%N) | cut -c -16 | tr \[a-z\] \[A-Z\])'
alias rnd24='echo $(sha224hmac <<< $(date +%s%N) | cut -c -24 | tr \[a-z\] \[A-Z\])'
alias rnd32='echo $(sha224hmac <<< $(date +%s%N) | cut -c -32 | tr \[a-z\] \[A-Z\])'

# ------------------------------------------------------------------------------
# Modified by Luxcium
# Original author Dongweiming <ciici123@gmail.com>
# ------------------------------------------------------------------------------
alias ping='ping -c 5'
alias clr='clear; echo Currently logged in on $TTY, as $USER in directory $PWD.'
alias path='print -l $path'
alias mkdir='mkdir -pv'
# get top process eating memory
alias psmemall='ps -e -orss=,args= | sort -b -k1,1n'
alias psmem='ps -e -orss=,args= | sort -b -k1,1n| head -10'
# get top process eating cpu if not work try excute : export LC_ALL='C'
alias pscpuall='ps -e -o pcpu,cpu,nice,state,cputime,args|sort -k1,1n -nr'
alias pscpu='ps -e -o pcpu,cpu,nice,state,cputime,args|sort -k1,1n -nr | head -10'
# top10 of the history
alias hist5='print -l ${(o)history%% *} | uniq -c | sort -nr | head -n 5'
alias hist10='print -l ${(o)history%% *} | uniq -c | sort -nr | head -n 10'
alias hist15='print -l ${(o)history%% *} | uniq -c | sort -nr | head -n 15'
alias hist20='print -l ${(o)history%% *} | uniq -c | sort -nr | head -n 20'
alias hist25='print -l ${(o)history%% *} | uniq -c | sort -nr | head -n 25'
alias hist50='print -l ${(o)history%% *} | uniq -c | sort -nr | head -n 50'
alias histall='print -l ${(o)history%% *} | uniq -c | sort -nr'
# ------------------------------------------------------------------------------
alias mktmp='TMPDIRLOCATION="/tmp/LXCM$(uxid)"; mkdir "${TMPDIRLOCATION:0:27}S"; cd "${TMPDIRLOCATION:0:27}S" ;unset -v TMPDIRLOCATION'
# ---- REDIS-CLI ---------------------------------------------------------------
alias rcli="redis-cli"
alias redisall="redis-cli keys \*"
alias smembers="redis-cli smembers"
alias hgetall="redis-cli hgetall"
alias hexist="redis-cli hexist"
alias exists="redis-cli exists"
# ----           ---------------------------------------------------------------
# SYMBOL_ITEM:IEX_CLOUD@JRI
alias ucp="sudo nice -n -10 ionice -c 1 -n 5 cp -uRL"
alias vucp="sudo nice -n -10 ionice -c 1 -n 5 cp -vuR"
alias vrmf="sudo nice -n -15 ionice -c 1 -n 3 rm -vRf"
alias upnboot="sudo nice -n -15 ionice -c 1 -n 3 dnf update ;sudo reboot"
alias al="ls -alhSvF -X"
alias alt="ls -alGhSvF -rt"
alias alu="ls -alGhSvF -rut"
alias alc="ls -alGhSvF -rct"

alias rmout="rm -fr ./out"

alias lxicode="nice -5 /home/luxcium/bin/code-luxcium.io; cd /home/luxcium/dev/vscode-luxcium.io/project/luxcium.io"

alias rdhard="rdfind -deterministic true -followsymlinks true -removeidentinode false -makehardlinks true -deleteduplicates false -outputname 'rdhard-results.txt' ./"

alias rdsoft="rdfind -deterministic true -followsymlinks true -removeidentinode false -makesymlinks true -deleteduplicates false -outputname 'rdsoft-results.txt' ./"

alias rdsoftdry="rdfind -n true -deterministic true -followsymlinks true -removeidentinode false -makesymlinks true -deleteduplicates false -outputname 'rddry-results.txt' ./"

alias rdharddry="rdfind -n true -deterministic true -followsymlinks true -removeidentinode false -makehardlinks true -deleteduplicates false -outputname 'rdhard-results.txt' ./"
alias apt-get="sudo dnf"
alias apt="sudo dnf"
alias dnf="sudo dnf"

alias ahmyzsh="code ~/ahmyzsh"
alias testtext="echo '0OoLl1IiGQgq;&function;=>*const;fi;!@ ( ) [ ] { } « » < > (‽)-?'"

alias wheelr="sudo chgrp -R wheel ./ && sudo chmod -c -R g+r ./"
alias wheelw="sudo chgrp -R wheel ./ && sudo chmod -c -R g+w ./"
alias wheelx="sudo chgrp -R wheel ./ && sudo chmod -c -R g+x ./"

alias wheelrw="wheelr;wheelw"
alias wheelrx="wheelr;wheelx"
alias wheelwx="wheelw;wheelx"
alias wheelrwx="wheelr;wheelw;wheelx"
