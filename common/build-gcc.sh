#!/bin/zsh

. /etc/lsb-release
if [ "$DISTRIB_RELEASE" != "12.04" ]; then
  exit 0
fi

VERSION=4.8.4

source ~/.zshrc
set -eu

cd $HOME
export BUILD="$HOME/build"
export SRC="$HOME/gcc-$VERSION"

curl "http://mirrors.concertpass.com/gcc/releases/gcc-$VERSION/gcc-$VERSION.tar.bz2"| tar xj

cd $SRC
./contrib/download_prerequisites

unset CC
unset CXX
export CFLAGS='-O3'
export CXXFLAGS=$CFLAGS

mkdir $BUILD && cd $BUILD
$SRC/configure CFLAGS="$CFLAGS" CXXFLAGS="$CXXFLAGS" --prefix=$PREFIX --enable-languages=c,c++
make -j$PROC_COUNT
make install

rm -rf $SRC $BUILD
