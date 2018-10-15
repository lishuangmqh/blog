#!/bin/bash

yum install wget gcc gcc-c++ make zlib-devel perl python-devel ncurses-devel swig -y

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


