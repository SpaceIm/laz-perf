#!/bin/bash -e
# Builds and tests laz-perf
#

# g++4.8.1
if [ "$CXX" = "g++" ]; then 
	export CXX="g++-4.8";
fi

# clang 3.4
if [ "$CXX" == "clang++" ]; then 
	export CXX="clang++-3.4";
fi

sh laszip.sh
sh liblas.sh

cmake \
	-DCMAKE_BUILD_TYPE=Release \
	.

make VERBOSE=1

sh download-test-sets.sh
ctest -V
