这是一个最简单的pass， 将pass源代码编译成为动态链接库， 使用opt -load 调用该pas
在本目录下执行如下命令：
mkdir build
cd build
cmake ..
make
cd ..
opt -load build/funcblockcount/*.so -funcblockcount test.ll


查看funcblockcount/funcblockcount/FuncBlockCount.cpp 了解Pass代码基本结构



