#!/bin/bash

yum install wget gcc gcc-c++ make zlib-devel perl python-devel ncurses-devel swig -y

wget https://cmake.org/files/v3.12/cmake-3.12.3.tar.gz
tar -zxvf cmake-3.12.3.tar.gz
cd cmake-3.12.3
./bootstrap --prefix=/usr/local
make
make install

wget http://releases.llvm.org/6.0.1/llvm-6.0.1.src.tar.xz
wget http://releases.llvm.org/6.0.1/cfe-6.0.1.src.tar.xz

tar --no-same-owner -xvf llvm-6.0.1.src.tar.xz
tar --no-same-owner -xvf cfe-6.0.1.src.tar.xz

mv llvm-6.0.1.src llvm
mv cfe-6.0.1.src llvm/tools/clang

mkdir build
cd build/
cmake -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_ASSERTIONS=Off ../llvm/
make -j${CPU_NUM}
make install


