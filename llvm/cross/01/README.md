### 编译的流程是：

1. 使用clang生成LLVM的内部码IR (bitcode)
2. 使用llc将bitcode编译成arm的汇编
3. 使用arm-linux-as、arm-linux-ld生成可执行的ELF文件

### 依赖说明

1. llvm 3.0
2. clang 3.0
3. alpha-linux-gcc

### 命令

```
# 生成bitcode
clang -emit-llvm -c test.c -o test.bc

# lli可以直接执行bitcode
lli test.bc

# 将bitcode编译成arm汇编
llc -march=alpha test.bc -o test.s

# 使用arm-linux-*系统工具 编译、链接
alpha-linux-gcc -o test test.s
```

* ubuntu 安装alpha-linux-gcc
`apt install -y alpha-linux-gcc`

