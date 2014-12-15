#!/bin/bash

if [ "$(uname)" == "Darwin" ]; then
    export JAVA_HOME=$(/usr/libexec/java_home)
    export JRE_HOME=${JAVA_HOME}/jre
else
    export JAVA_HOME="/usr/lib/jvm/java"
    export JRE_HOME="/usr/lib/jvm/jre"
fi

#BLD_DIR=`pwd`

#SRC_DIR=$RECIPE_DIR/..
#pushd $SRC_DIR

mkdir -vp ${PREFIX}/bin;
mkdir -vp ${PREFIX}/lib;

# build focused_crawler

export TERM=${TERM:-dumb} 
./gradlew clean installApp --stacktrace

echo `pwd`
pushd build/install/ache
cp -r bin/ ${PREFIX}/bin
cp -r lib/ ${PREFIX}/lib