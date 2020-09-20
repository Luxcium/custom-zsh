function load_zlogout() {
  ##$ Interactive,login

  (
    (builtin cd $AHMYZSH &&
      find $(pwd) | grep .zwc | foreachline rm -f &&
      zsh_compile_all_R) &
  )                                           # 1.2385s
  ( (_p9k_dump_instant_prompt 2>/dev/null) &) # 0.0310s
  ( (compute_path 2>/dev/null) &)             # 0.4123s

  echo -en "\u001b[1A"
  echo -en "\e[38;2;252;198;36m                                    \u001b[1000D"
  sleep 0.085
  echo -en "\e[38;2;252;198;36m          B                         \u001b[1000D"
  sleep 0.085
  echo -en "\e[38;2;252;198;36m         BY                         \u001b[1000D"
  sleep 0.085
  echo -en "\e[38;2;252;198;36m        BYE                         \u001b[1000D"
  sleep 0.085
  echo -en "\e[38;2;252;198;36m       BYE                          \u001b[1000D"
  sleep 0.085
  echo -en "\e[38;2;252;198;36m      BYE !                         \u001b[1000D"
  sleep 0.085
  echo -en "\e[38;2;252;198;36m     BYE !!                         \u001b[1000D"
  sleep 0.085
  echo -en "\e[38;2;252;198;36m    BYE !!!                         \u001b[1000D"
  sleep 0.085
  echo -en "\e[38;2;252;198;36m   BYE !!!                          \u001b[1000D"
  sleep 0.085
  echo -en "\e[38;2;252;198;36m  BYE !!!                           \u001b[1000D"
  sleep 0.085
  echo -en "\e[38;2;252;198;36m  YE !!!                            \u001b[1000D"
  sleep 0.085
  echo -en "\e[38;2;252;198;36m  E !!!                             \u001b[1000D"
  sleep 0.085
  echo -en "\e[38;2;252;198;36m   !!!                              \u001b[1000D"
  sleep 0.085
  echo -en "\e[38;2;252;198;36m  !!!                               \u001b[1000D"
  sleep 0.085
  echo -en "\e[38;2;252;198;36m  !!                                \u001b[1000D"
  sleep 0.085
  echo -en "\e[38;2;252;198;36m  !                               \u001b[1000D\a"
  sleep 0.085

}

#      \u001b[1000D
# Up: \u001b[{n}A
# Down: \u001b[{n}B
# Right: \u001b[{n}C
# Left: \u001b[{n}D
