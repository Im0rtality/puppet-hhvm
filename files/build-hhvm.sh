cd /usr/local/src/hiphop-php
export CMAKE_PREFIX_PATH=`pwd`
cd /usr/local/src/hiphop-php/hhvm
git submodule update --init --recursive
cmake .
make
make install