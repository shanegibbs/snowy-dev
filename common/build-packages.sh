#!/bin/bash -eu

cat /etc/resolv.conf

ping -c1 8.8.8.8
ping -c1 google.com

. /etc/lsb-release

apt-get update
apt-get -y upgrade

# dependencies
PACKAGES="libc6-dev-i386 m4 libffi-dev gettext curl wget build-essential libncurses5-dev zlib1g-dev pkg-config groff python python-dev automake man libedit-dev"

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

apt-get build-dep -y lldb-3.6

apt-get clean
