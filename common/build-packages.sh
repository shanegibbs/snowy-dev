#!/bin/bash -eu

. /etc/lsb-release

apt-get update

# dependencies
PACKAGES="libc6-dev-i386 m4 libffi-dev gettext curl wget build-essential libncurses5-dev zlib1g-dev pkg-config groff python automake"

# dev tools
PACKAGES="$PACKAGES sudo zsh vim ctags tmux git openssh-server"

if [ "$DISTRIB_RELEASE" == "14.04" ]; then
  apt-get install -y $PACKAGES
elif [ "$DISTRIB_RELEASE" == "12.04" ]; then
  apt-get install -y $PACKAGES
else
  echo Unsupported OS
  exit 1
fi

apt-get clean
