#!/bin/bash
 
build_func1() {
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --disable-static || return 1
    make || return 1
    sudo make install 
}

build_func2() {
	make clean
    ./autogen.sh \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var || return 1
    make || return 1
    sudo make install
}

build_func2

