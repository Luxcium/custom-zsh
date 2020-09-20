function load_zlogout() {
  ##$ Interactive,login
  ( (_p9k_dump_instant_prompt 2>/dev/null) &) # 0.0310s
  ( (compute_path 2>/dev/null) &)             # 0.3838s
  ( (zsh_compile_all_R 2>/dev/null) &)        # 0.3157s
  echo -en "\u001b[1A"
  echo -en "\e[38;2;252;198;36m                                    \u001b[1000D"
  sleep 0.028
  echo -en "\e[38;2;252;198;36m          B                         \u001b[1000D"
  sleep 0.028
  echo -en "\e[38;2;252;198;36m         BY                         \u001b[1000D"
  sleep 0.028
  echo -en "\e[38;2;252;198;36m        BYE                         \u001b[1000D"
  sleep 0.028
  echo -en "\e[38;2;252;198;36m       BYE                          \u001b[1000D"
  sleep 0.028
  echo -en "\e[38;2;252;198;36m      BYE !                         \u001b[1000D"
  sleep 0.028
  echo -en "\e[38;2;252;198;36m     BYE !!                         \u001b[1000D"
  sleep 0.028
  echo -en "\e[38;2;252;198;36m    BYE !!!                         \u001b[1000D"
  sleep 0.028
  echo -en "\e[38;2;252;198;36m   BYE !!!                          \u001b[1000D"
  sleep 0.028
  echo -en "\e[38;2;252;198;36m  BYE !!!                           \u001b[1000D"
  sleep 0.028
  echo -en "\e[38;2;252;198;36m  YE !!!                            \u001b[1000D"
  sleep 0.028
  echo -en "\e[38;2;252;198;36m  E !!!                             \u001b[1000D"
  sleep 0.028
  echo -en "\e[38;2;252;198;36m   !!!                              \u001b[1000D"
  sleep 0.028
  echo -en "\e[38;2;252;198;36m  !!!                               \u001b[1000D"
  sleep 0.028
  echo -en "\e[38;2;252;198;36m  !!                                \u001b[1000D"
  sleep 0.028
  echo -en "\e[38;2;252;198;36m  !                               \u001b[1000D\a"
  sleep 0.028
}

#      \u001b[1000D
# Up: \u001b[{n}A
# Down: \u001b[{n}B
# Right: \u001b[{n}C
# Left: \u001b[{n}D
