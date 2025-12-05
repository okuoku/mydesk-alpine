#!/bin/sh
MYDIR=`pwd`
cd $MYDIR/skkbuild/Dockerfile-alpine
docker build --tag skkbuild .
cd $MYDIR/baseimage
docker build --tag mydesk-base .
