#! /usr/bin/env sh

# script to updae (sync) main submodules of the project with
# origin master & origin luxcium & origin pc-master-race

(
  cd $HOME/ahmyzsh/ && git checkout master && pull
  git checkout luxcium && pull
  git checkout pc-master-race && pull && push
) &

(
  cd $HOME/ahmyzsh/custom-tmux/ && git checkout master && pull
  git checkout luxcium && pull
  git checkout pc-master-race && pull && push
) &

(
  cd $HOME/ahmyzsh/custom-zsh/ && git checkout master && pull
  git checkout luxcium && pull
  git checkout pc-master-race && pull && push
) &

(
  cd $HOME/ahmyzsh/nerd-fonts/ && git checkout master && pull
  git checkout luxcium && pull
  git checkout pc-master-race && pull && push
) &

(
  cd $HOME/ahmyzsh/node-repl/ && git checkout master && pull
  git checkout luxcium && pull
  git checkout pc-master-race && pull && push
) &

(
  cd $HOME/ahmyzsh/ohmyzsh/ && git checkout master && pull
  git checkout luxcium && pull
  git checkout pc-master-race && pull && push
) &

(
  cd $HOME/ahmyzsh/powerlevel10k/ && git checkout master && pull
  git checkout luxcium && pull
  git checkout pc-master-race && pull && push
) &

(
  cd $HOME/ahmyzsh/powerline/ && git checkout master && pull
  git checkout luxcium && pull
  git checkout pc-master-race && pull && push
) &

(
  cd $HOME/ahmyzsh/python-repl/ && git checkout master && pull
  git checkout luxcium && pull
  git checkout pc-master-race && pull && push
) &

exit 0
