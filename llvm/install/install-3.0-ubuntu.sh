#!/bin/bash

apt install wget gcc gcc-c++ make cmake  perl  -y

wget http://releases.llvm.org/3.0/llvm-3.0.tar.gz
wget http://releases.llvm.org/3.0/clang-3.0.tar.gz

tar --no-same-owner -xvf llvm-3.0.tar.gz
tar --no-same-owner -xvf clang-3.0.tar.xz

mv llvm-3.0.src llvm
mv clang-3.0.src llvm/tools/clang

mkdir build
cd build/
cmake -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_ASSERTIONS=Off ../llvm/
make -j${CPU_NUM}
make install

