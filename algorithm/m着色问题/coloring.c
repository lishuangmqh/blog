#include <stdio.h>    
#include <math.h>
#include <stdbool.h>

#define n 5
#define m 4 //颜色数

// 将图转换为邻接矩阵
int a[n+1][n+1]={
    {0,0,0,0,0,0},  
    {0,0,1,1,1,0},  
    {0,1,0,1,1,1},  
    {0,1,1,0,1,0},  
    {0,1,1,1,0,1},  
    {0,0,1,0,1,0}
};   

// 定义变量存储方案的个数
int count=0;

//涂颜色数组
int color[n+1]={0};

// 是否可以涂颜色
bool ok(int x){
	// 循环遍历所有顶点
    for(int i=1; i<=n; i++){
    	// 如果点相邻 且 颜色相同
        if(a[x][i]==1 && color[x]==color[i]){//不能为1，不重复
            return false;
        }
    }
    return true;
}

void dfs(int t){
	// 如果大于n说明所有顶点全部被着色了，是一个着色方案，count+1，最后一个点也是通过的会多调用一次dfs 最终 t = n+1
    if(t > n){
        count++;
    }else{
    	// 循环所有的颜色
        for(int i=1; i<=m; i++){
        	// 将定点t着色成 i
            color[t]=i;
            // 如果可以继续往下一个顶点涂，就继续调用dfs涂下一个顶点 (t+1)
            if(ok(t)){
                dfs(t+1);
            }
            // 如果不能继续涂，则把涂色方案数组t重置为0
            color[t]=0;
        }
    }
}

int main(){  
    dfs(1);//从1开始
    printf("%d\n",count);
    return 0;    
}    

