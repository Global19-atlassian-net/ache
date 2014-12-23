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

mkdir -vp ${PREFIX}/bin;
mkdir -vp ${PREFIX}/lib/ache/bin;
mkdir -vp ${PREFIX}/lib/ache/lib;

# build focused_crawler
export TERM=${TERM:-dumb} 
./gradlew clean installApp --stacktrace

pushd build/install/ache

cp -r bin/* ${PREFIX}/lib/ache/bin/
cp -r lib/* ${PREFIX}/lib/ache/lib/

ln -s "${PREFIX}/lib/ache/bin/ache" "${PREFIX}/bin/ache"

+ ln -s /Users/cdoig/anaconda/envs/_build/lib/ache/bin/ache /Users/cdoig/anaconda/envs/_build/bin/ache
ln: /Users/cdoig/anaconda/envs/_build/bin/ache: No such file or directory