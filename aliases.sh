export ALIASES_FOLDER="${CUSTOM_ZSH}/sources/aliases"
export ALIASES_FEDORA_FOLDER="${ALIASES_FOLDER}/fedora"
source_ "${ALIASES_FEDORA_FOLDER}/bells.sh"
source_ "${ALIASES_FOLDER}/aliases.sh"
ZSH_LOVERS

alias rnd2='echo $(sha224hmac <<< $(date +%s%N) | cut -c -2 | tr \[a-z\] \[A-Z\])'
alias rnd4='echo $(sha224hmac <<< $(date +%s%N) | cut -c -4 | tr \[a-z\] \[A-Z\])'
alias rnd6='echo $(sha224hmac <<< $(date +%s%N) | cut -c -6 | tr \[a-z\] \[A-Z\])'
alias rnd8='echo $(sha224hmac <<< $(date +%s%N) | cut -c -8 | tr \[a-z\] \[A-Z\])'
alias rnd10='echo $(sha224hmac <<< $(date +%s%N) | cut -c -10 | tr \[a-z\] \[A-Z\])'
alias rnd12='echo $(sha224hmac <<< $(date +%s%N) | cut -c -12 | tr \[a-z\] \[A-Z\])'
alias rnd14='echo $(sha224hmac <<< $(date +%s%N) | cut -c -14 | tr \[a-z\] \[A-Z\])'
alias rnd16='echo $(sha224hmac <<< $(date +%s%N) | cut -c -16 | tr \[a-z\] \[A-Z\])'
alias rnd18='echo $(sha224hmac <<< $(date +%s%N) | cut -c -18 | tr \[a-z\] \[A-Z\])'
alias rnd20='echo $(sha224hmac <<< $(date +%s%N) | cut -c -20 | tr \[a-z\] \[A-Z\])'
alias rnd22='echo $(sha224hmac <<< $(date +%s%N) | cut -c -22 | tr \[a-z\] \[A-Z\])'
alias rnd24='echo $(sha224hmac <<< $(date +%s%N) | cut -c -24 | tr \[a-z\] \[A-Z\])'
alias rnd26='echo $(sha224hmac <<< $(date +%s%N) | cut -c -26 | tr \[a-z\] \[A-Z\])'
alias rnd28='echo $(sha224hmac <<< $(date +%s%N) | cut -c -28 | tr \[a-z\] \[A-Z\])'
alias rnd30='echo $(sha224hmac <<< $(date +%s%N) | cut -c -30 | tr \[a-z\] \[A-Z\])'
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

# ----REDIS-CLI-----------------------------------------------------------------
alias rcli="redis-cli"
alias redisall="redis-cli keys \*"
alias smembers="redis-cli smembers"
alias hgetall="redis-cli hgetall"
alias hexist="redis-cli hexist"
alias exists="redis-cli exists"
# SYMBOL_ITEM:IEX_CLOUD@JRI
# ------------------------------------------------------------------------------

alias killdd="sudo kill $(pidof dd)"
unset DD5_

alias ddx="sudo dd if=/dev/zero of=/dev/null &"
alias dd5="(
  sudo killall dd &>/dev/null
  sudo dd if=/dev/zero of=/dev/null &
  sudo dd if=/dev/zero of=/dev/null &
  sudo dd if=/dev/zero of=/dev/null &
  sudo dd if=/dev/zero of=/dev/null &
  sudo dd if=/dev/zero of=/dev/null &
  (
  sleep 10
  sudo killall dd
  ) &
  )"

alias dd10="(
  sudo killall dd &>/dev/null
  sudo dd if=/dev/zero of=/dev/null &
  sudo dd if=/dev/zero of=/dev/null &
  sudo dd if=/dev/zero of=/dev/null &
  sudo dd if=/dev/zero of=/dev/null &
  sudo dd if=/dev/zero of=/dev/null &
  sudo dd if=/dev/zero of=/dev/null &
  sudo dd if=/dev/zero of=/dev/null &
  sudo dd if=/dev/zero of=/dev/null &
  sudo dd if=/dev/zero of=/dev/null &
  sudo dd if=/dev/zero of=/dev/null &
  (
  sleep 10
  sudo killall dd
  ) &
  )"

alias dd5x="(
  sudo killall dd &>/dev/null
  sudo nice -n 20 dd if=/dev/zero of=/dev/null &
  sleep 0.5
  sudo nice -n 20 dd if=/dev/zero of=/dev/null &
  sleep 0.5
  sudo nice -n 20 dd if=/dev/zero of=/dev/null &
  sleep 0.5
  sudo nice -n 20 dd if=/dev/zero of=/dev/null &
  sleep 0.5
  sudo nice -n 20 dd if=/dev/zero of=/dev/null &
  sleep 0.5
  (
  sleep 10
  sudo killall dd
  ) &
  )"

alias dd10x="(
  sudo killall dd &>/dev/null
  sudo dd if=/dev/zero of=/dev/null &
  sleep 0.5
  sudo dd if=/dev/zero of=/dev/null &
  sleep 0.5
  sudo dd if=/dev/zero of=/dev/null &
  sleep 0.5
  sudo dd if=/dev/zero of=/dev/null &
  sleep 0.5
  sudo dd if=/dev/zero of=/dev/null &
  sleep 0.5
  sudo dd if=/dev/zero of=/dev/null &
  sleep 0.5
  sudo dd if=/dev/zero of=/dev/null &
  sleep 0.5
  sudo dd if=/dev/zero of=/dev/null &
  sleep 0.5
  sudo dd if=/dev/zero of=/dev/null &
  sleep 0.5
  sudo dd if=/dev/zero of=/dev/null &
  sleep 0.5
  (
  sleep 10
  sudo killall dd
  ) &
  )"

alias dd20x="(
  sudo killall dd &>/dev/null
  sudo dd if=/dev/zero of=/dev/null &
  sleep 0.5
    sudo nice -n 20 dd if=/dev/zero of=/dev/null &
  sleep 0.5
    sudo nice -n 20 dd if=/dev/zero of=/dev/null &
  sleep 0.5
    sudo nice -n 20 dd if=/dev/zero of=/dev/null &
  sleep 0.5
    sudo nice -n 20 dd if=/dev/zero of=/dev/null &
  sleep 0.5
    sudo nice -n 20 dd if=/dev/zero of=/dev/null &
  sleep 0.5
    sudo nice -n 20 dd if=/dev/zero of=/dev/null &
  sleep 0.5
    sudo nice -n 20 dd if=/dev/zero of=/dev/null &
  sleep 0.5
    sudo nice -n 20 dd if=/dev/zero of=/dev/null &
  sleep 0.5
    sudo nice -n 20 dd if=/dev/zero of=/dev/null &
  sleep 0.5
    sudo nice -n 20 dd if=/dev/zero of=/dev/null &
  sleep 0.5
    sudo nice -n 20 dd if=/dev/zero of=/dev/null &
  sleep 0.5
    sudo nice -n 20 dd if=/dev/zero of=/dev/null &
  sleep 0.5
    sudo nice -n 20 dd if=/dev/zero of=/dev/null &
  sleep 0.5
    sudo nice -n 20 dd if=/dev/zero of=/dev/null &
  sleep 0.5
    sudo nice -n 20 dd if=/dev/zero of=/dev/null &
  sleep 0.5
    sudo nice -n 20 dd if=/dev/zero of=/dev/null &
  sleep 0.5
    sudo nice -n 20 dd if=/dev/zero of=/dev/null &
  sleep 0.5
    sudo nice -n 20 dd if=/dev/zero of=/dev/null &
  sleep 0.5
    sudo nice -n 20 dd if=/dev/zero of=/dev/null &
  sleep 0.5
  (
  sleep 5
  sudo killall dd
  ) &
  )"

alias dd20xx="(
  sudo killall dd &>/dev/null
  sudo dd if=/dev/zero of=/dev/null &
  sleep 0.25
    sudo dd if=/dev/zero of=/dev/null &
  sleep 0.25
    sudo dd if=/dev/zero of=/dev/null &
  sleep 0.25
    sudo dd if=/dev/zero of=/dev/null &
  sleep 0.25
    sudo dd if=/dev/zero of=/dev/null &
  sleep 0.25
    sudo dd if=/dev/zero of=/dev/null &
  sleep 0.25
    sudo dd if=/dev/zero of=/dev/null &
  sleep 0.25
    sudo dd if=/dev/zero of=/dev/null &
  sleep 0.25
    sudo dd if=/dev/zero of=/dev/null &
  sleep 0.25
    sudo dd if=/dev/zero of=/dev/null &
  sleep 0.25
    sudo dd if=/dev/zero of=/dev/null &
  sleep 0.25
    sudo dd if=/dev/zero of=/dev/null &
  sleep 0.25
    sudo dd if=/dev/zero of=/dev/null &
  sleep 0.25
    sudo dd if=/dev/zero of=/dev/null &
  sleep 0.25
    sudo dd if=/dev/zero of=/dev/null &
  sleep 0.25
    sudo dd if=/dev/zero of=/dev/null &
  sleep 0.25
    sudo dd if=/dev/zero of=/dev/null &
  sleep 0.25
    sudo dd if=/dev/zero of=/dev/null &
  sleep 0.25
    sudo dd if=/dev/zero of=/dev/null &
  sleep 0.25
    sudo dd if=/dev/zero of=/dev/null &
  sleep 0.25
  (
  sleep 10
  sudo killall dd
  ) &
  )"

alias dd20xxx="(
  sudo killall dd &>/dev/null
    sudo nice -n 20  dd if=/dev/zero of=/dev/null &
  sleep 0.5
    sudo nice -n 20  dd if=/dev/zero of=/dev/null &
  sleep 0.5
    sudo nice -n 20  dd if=/dev/zero of=/dev/null &
  sleep 0.5
    sudo nice -n 20  dd if=/dev/zero of=/dev/null &
  sleep 0.5
    sudo nice -n 20  dd if=/dev/zero of=/dev/null &
  sleep 0.5
    sudo nice -n 20  dd if=/dev/zero of=/dev/null &
  sleep 0.5
    sudo nice -n 20  dd if=/dev/zero of=/dev/null &
  sleep 0.5
    sudo nice -n 20 dd if=/dev/zero of=/dev/null &
  sleep 0.5
    sudo nice -n 20  dd if=/dev/zero of=/dev/null &
  sleep 0.5
    sudo nice -n 20 dd if=/dev/zero of=/dev/null &
  sleep 0.5
    sudo nice -n -15 dd if=/dev/zero of=/dev/null &
  sleep 0.5
    sudo nice -n -15  dd if=/dev/zero of=/dev/null &
  sleep 0.5
    sudo nice -n -15 dd if=/dev/zero of=/dev/null &
  sleep 0.5
    sudo nice -n -15 dd if=/dev/zero of=/dev/null &
  sleep 0.5
    sudo nice -n -15 dd if=/dev/zero of=/dev/null &
  sleep 0.5
    sudo nice -n -15 dd if=/dev/zero of=/dev/null &
  sleep 0.5
    sudo nice -n -15 dd if=/dev/zero of=/dev/null &
  sleep 0.5
    sudo nice -n -15 dd if=/dev/zero of=/dev/null &
  sleep 0.5
    sudo nice -n -15 dd if=/dev/zero of=/dev/null &
  sleep 0.5
    sudo nice -n -15 dd if=/dev/zero of=/dev/null &
  sleep 0.5
  (
  sleep 20
  sudo killall dd
  ) &
  )"
