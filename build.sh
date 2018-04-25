#!/bin/bash

# Build script for lrose-blaze
# Bruno Melli 04-13-08

USERNAME=mjskier
ORGANIZATION=nsflrose
IMAGE=lrose-blaze

VERSION=`date +%m%d%Y`
echo "$VERSION" > VERSION

if [[ ! -r checkout_and_build_auto.py ]]; then
    wget "https://raw.githubusercontent.com/NCAR/lrose-core/master/build/checkout_and_build_auto.py"
fi

if [[ ! -r checkout_and_build_auto.py ]]; then
    echo "Could not fetch checkout_and_build_auto.py"
    echo "Try to get it by hand and rerun"
    exit 1
else
    chmod +x checkout_and_build_auto.py
fi

docker build -t $ORGANIZATION/$IMAGE:latest .
