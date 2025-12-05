#!/bin/sh
MYDIR=`pwd`
cd $MYDIR/skkbuild/Dockerfile-alpine
docker build --tag skkbuild .
cd $MYDIR/image
docker build --tag mydesk .
