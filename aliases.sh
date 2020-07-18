export ALIASES_FOLDER="${CUSTOM_ZSH}/sources/aliases"
export ALIASES_FEDORA_FOLDER="${ALIASES_FOLDER}/fedora"
source_ "${ALIASES_FEDORA_FOLDER}/bells.sh"
source_ "${ALIASES_FOLDER}/aliases.sh"
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

# ---- REDIS-CLI ---------------------------------------------------------------
alias rcli="redis-cli"
alias redisall="redis-cli keys \*"
alias smembers="redis-cli smembers"
alias hgetall="redis-cli hgetall"
alias hexist="redis-cli hexist"
alias exists="redis-cli exists"
# SYMBOL_ITEM:IEX_CLOUD@JRI
# ------- CPU TESTING WITH DD NOTHING TO NOWHERE -------------------------------

function ddsoft() {
  (
    sudo ionice -c 3 nice -n 35 dd if=/dev/zero of=/dev/null &
  )
}

function ddhard() {
  (
    sudo ionice -c 1 -n 0 nice -n -35 dd if=/dev/zero of=/dev/null &
  )
}

function dd4soft() {
  (
    ddsoft
    ddsoft
    ddsoft
    ddsoft
  )
}

function dd4hard() {
  (
    ddhard
    ddhard
    ddhard
    ddhard
  )
}

function dd5soft() {
  (
    ddsoft
    ddsoft
    ddsoft
    ddsoft
    ddsoft
  )
}

function dd5hard() {
  (
    ddhard
    ddhard
    ddhard
    ddhard
    ddhard
  )
}

alias dd4='(
    echo "4 softs dd moving nothing to nowhere the for 40 seconds"
    sudo killall dd &>/dev/null && echo "max 4 at the time for max 40 seconds"
  (
      dd4soft
    )
    (
      sleep 40
      echo "killall dd"
      sudo killall dd
    )
  )&'

alias hardd4='(
    echo "4 hards dd moving nothing to nowhere the for 40 seconds"
    sudo killall dd &>/dev/null && echo "max 4 at the time for max 40 seconds"
    (
      dd4hard
    )
    (
      sleep 40
      echo "killall dd"
      sudo killall dd &>/dev/null
    )
  ) &'

alias dd5='(
    echo "5 softs dd moving nothing to nowhere the for 20 seconds"
    sudo killall dd &>/dev/null && echo "max 5 at the time for max 20 seconds"
    (
      dd5soft
    )
    (
      sleep 20
      echo "killall dd"
      sudo killall dd
    )
  )&'

alias hardd5='(
    echo "5 hards dd moving nothing to nowhere the for 20 seconds"
    sudo killall dd &>/dev/null && echo "max 5 at the time for max 20 seconds"
    (
      dd5hard
    )
    (
      sleep 20
      echo "killall dd"
      sudo killall dd &>/dev/null
    )
  ) &'

alias dd10='(
    echo "10 softs dd moving nothing to nowhere the for 15 seconds"
    sudo killall dd &>/dev/null && echo "max 15 at the time for max 15 seconds"
    (
      dd5soft
      dd5soft
    )
    (
      sleep 15
      echo "killall dd"
      sudo killall dd &>/dev/null
    )
  ) &'

alias hardd10='(
    echo "10 hards dd moving nothing to nowhere the for 15 seconds"
    sudo killall dd &>/dev/null && echo "max 15 at the time for max 15 seconds"
    (
      dd5hard
      dd5hard
    )
    (
      sleep 15
      echo "killall dd"
      sudo killall dd &>/dev/null
    )
  ) &'

alias dd15='(
    echo "15 softs dd moving nothing to nowhere the for 10 seconds"
    sudo killall dd &>/dev/null && echo "max 15 at the time for max 10 seconds"
    (
      dd5soft
      dd5soft
      dd5soft
    )
    (
      sleep 10
      echo "killall dd"
      sudo killall dd &>/dev/null
    )
  ) &'

alias hsrdd15='(
    echo "15 hards dd moving nothing to nowhere the for 10 seconds"
    sudo killall dd &>/dev/null && echo "max 15 at the time for max 10 seconds"
    (
      dd5hard
      dd5hard
      dd5hard
    )
    (
      sleep 10
      echo "killall dd"
      sudo killall dd &>/dev/null
    )
  ) &'

alias dd20='(
    echo "20 softs dd moving nothing to nowhere the for 5 seconds"
    sudo killall dd &>/dev/null && echo "max 20 at the time for max 5 seconds"
    (
      dd5soft
      dd5soft
      dd5soft
      dd5soft
    )
    (
      sleep 5
      echo "killall dd"
      sudo killall dd &>/dev/null
    )
  ) &'

alias hardd20='(
    echo "20 hards dd moving nothing to nowhere the for 5 seconds"
    sudo killall dd &>/dev/null && echo "max 20 at the time for max 5 seconds"
    (
      dd5hard
      dd5hard
      dd5hard
      dd5hard
    )
    (
      sleep 5
      echo "killall dd"
      sudo killall dd &>/dev/null
    )
  ) &'
