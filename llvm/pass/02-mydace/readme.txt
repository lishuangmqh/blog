这是一个自定义的消除无用代码的pass， 将pass源代码编译成为动态链接库， 使用opt -load 调用该pas

在本目录下执行如下命令：
mkdir build
cd build
cmake ..
make
cd ..
opt -load build/myadce/*.so -myadce test.ll





