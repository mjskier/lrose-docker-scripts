#!/bin/bash

# This script is to be executed inside an lrose-blaze container
# It assume lrose-base is installed at /usr/local/lrose
#
# It also assumes that the container invocation was done such that this scrit,
# and package definition are available in $BUILD_ROOT
# The resulting .db package will be available n $BUILD_ROOT
#
# For example,
# docker run -v $HOME/docker/lrose-docker-scripts/debian:/build_lrose_blaze_pkg nsflrose/lrose-blaze /build_lrose_blaze_pkg/build_pkg.sh

LROSE_ROOT=/usr/local/lrose
BUILD_ROOT=/build_lrose_blaze_pkg
BUILD_DIR=lrose-blaze_20190105

if [ ! -d "$LROSE_ROOT" ]; then
    echo "-E- No such directory '$LROSE_ROOT'"
    exit 1
fi

cd $BUILD_ROOT
mkdir -p $BUILD_DIR/usr/local

# Make sure we have rsync
apt-get update
apt-get install -y rsync

# Mirror the /usr/local/lrose hierarchy under the BUILD_ROOT
rsync -avz /usr/local/lrose $BUILD_DIR/usr/local/

# Make the package
dpkg-deb --build lrose-blaze_20190105

# The resulting package can be installed with
# apt-get update
# apt install -y lrose-blaze_20190105.deb



