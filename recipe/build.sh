#!/bin/bash

./configure --prefix=$PREFIX \
            --disable-dependency-tracking \
            --enable-cxx \
            --enable-fortran

make
make install

if [[ $OSTYPE != darwin* ]]; then
    cp $RECIPE_DIR/../check-glibc.sh .
    bash check-glibc.sh $PREFIX/lib/ || exit 1
fi
