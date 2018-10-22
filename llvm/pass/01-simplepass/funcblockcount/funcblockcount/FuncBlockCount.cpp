#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm; // 使用llvm命名空间

namespace {
	// 定义pass主体类 包括属性ID和一个runOnFunction方法 
	struct FuncBlockCount : public FunctionPass {
		static char ID;
		// 构造函数
		FuncBlockCount() : FunctionPass( ID ) {}

		// pass 主体逻辑部分，传入一个函数引用作为参数
		bool runOnFunction( Function &F ) override {
			errs() << "Function " << F.getName() << '\n';
			return(false);
		}
	};
}

// 初始化类属性 ID
char FuncBlockCount::ID = 0;

// 注册这个pass
static RegisterPass<FuncBlockCount>	X( "funcblockcount", "Function Block Count", false, false );
