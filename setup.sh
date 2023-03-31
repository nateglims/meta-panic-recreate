#!/bin/bash

set -e

RELEASE=kirkstone

WORKDIR=$(pwd)/panic-reproduce
BUILDDIR=$WORKDIR/build
CONFDIR=$BUILDDIR/conf

mkdir -p $WORKDIR

[[ -e $WORKDIR/poky ]] || git -C $WORKDIR clone git://git.yoctoproject.org/poky -b $RELEASE
cd $WORKDIR/poky
. ./oe-init-build-env $BUILDDIR

[ -e $WORKDIR/meta-panic ] || git -C $WORKDIR clone git@github.com:nateglims/meta-panic-recreate.git meta-panic -b main

bitbake-layers add-layer $WORKDIR/meta-panic

cat << EOF >> $CONFDIR/local.conf
RUST_PANIC_STRATEGY = "abort"
EOF

# Fails
bitbake panic-abort-app

cat << EOF >> $CONFDIR/local.conf
TCLIBC = "musl"
EOF

# Succeeds
bitbake panic-abort-app
