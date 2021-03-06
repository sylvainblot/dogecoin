#!/bin/bash

if [ "$1" == "deps" ]; then
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew install git
brew install boost miniupnpc openssl berkeley-db4


git clone git://gitorious.org/qt/qt.git

cd qt

./configure -release -opensource -static -no-fast -no-qt3support -no-phonon -no-phonon-backend -no-declarative-debug -no-ssse3 -no-sse4.1 -no-sse4.2 -no-avx -no-neon -qt-zlib -qt-libpng -no-libmng -qt-libjpeg -openssl-linked -nomake examples -nomake demos -nomake docs -no-nis -no-cups -no-gtkstyle -no-nas-sound -no-opengl -no-openvg -no-glib -arch x86_64 -release -platform unsupported/macx-clang

make

make install


cd ..

else

git clone git://github.com/sylvainblot/koin.git

cd koin
make clean
make distclean
git checkout

/usr/local/Trolltech/Qt-4.8.6/bin/qmake
make -release

fi
