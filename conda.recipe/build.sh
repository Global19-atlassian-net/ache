#!/bin/bash

#if [ "$(uname)" == "Darwin" ]; then
#    export JAVA_HOME=$(/usr/libexec/java_home)
#    export JRE_HOME=${JAVA_HOME}/jre
#else
#    export JAVA_HOME="/usr/lib/jvm/java"
#    export JRE_HOME="/usr/lib/jvm/jre"
#fi

#BLD_DIR=`pwd`

#SRC_DIR=$RECIPE_DIR/..
#pushd $SRC_DIR

mkdir -vp ${PREFIX}/ache/bin;
mkdir -vp ${PREFIX}/ache/lib;

# build focused_crawler

export TERM=${TERM:-dumb} 
./gradlew clean installApp --stacktrace

pushd build/install/ache

cp -r bin/* ${PREFIX}/ache/bin/
cp -r lib/* ${PREFIX}/ache/lib/

ln -s ${PREFIX}/ache/bin/ache ${PREFIX}/bin/ache