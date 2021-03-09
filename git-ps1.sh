#!bin/bash

function extra_shorten() {
  out=$1
  for i in "${!GIT_PS1_PATH_SHORTENER[@]}"
  do
    out="${out/$i/${GIT_PS1_PATH_SHORTENER[$i]}}"
  done
  echo $out
}

function short_hostname() {
  out=$1
  for i in "${!GIT_PS1_HOST_SHORTENER[@]}"
  do
    out="${out/$i/${GIT_PS1_HOST_SHORTENER[$i]}}"
  done
  echo $out
}

GOT_GIT=0
if [ -f /etc/bash_completion.d/git5 ]; then
  source /etc/bash_completion.d/git5
  GOT_GIT=1
fi

if [ -f /usr/local/etc/bash_completion.d/git5 ]; then
  source /usr/local/etc/bash_completion.d/git5
  GOT_GIT=1
fi

if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
  source /usr/local/etc/bash_completion.d/git-completion.bash
  GOT_GIT=1
fi

if [ -f /usr/local/etc/bash_completion.d/git-prompt.sh ]; then
  source /usr/local/etc/bash_completion.d/git-prompt.sh
  GOT_GIT=1
fi

if [ -f $HOME/homebrew/etc/profile.d/bash_completion.sh ]; then
  source $HOME/homebrew/etc/profile.d/bash_completion.sh
  GOT_GIT=1
fi

if [ $GOT_GIT -eq 1 ]; then
  export PS1='${debian_chroot:+($debian_chroot)}\A \[\e[0;35m\]$(test "\u" != "dmurph" && echo "\u ")$(short_hostname "\H") \[\e[01;32m\]$(__git_ps1 "[%s]") \[\e[01;36m\]$(extra_shorten "\w")\[\e[01;00m\]$\[\e[00m\] '
fi