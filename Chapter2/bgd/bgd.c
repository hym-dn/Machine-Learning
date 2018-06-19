/**
 *  利用批梯度法实现线性回归
 *  y=x1*theta1+x2*theta2
 */
#include<stdio.h>
#include<math.h>

// x样本
static double x[4][2]={1.0,4.0,2.0,5.0,5.0,1.0,4.0,2.0};
// y样本
static double y[4]={19.0,26.0,19.0,20.0};
// 待拟合参数
static double theta[2]={0.001,0.001}; // 初值
// 学习效率
static const double alpha=0.001;
// 收敛界限
static const double conv=0.000001;
// 迭代上限
static const unsigned int iteras=10000;

// 计算y
static double calY(const unsigned int i){
    return(x[i][0]*theta[0]+x[i][1]*theta[1]);
}

// 计算theta
static void calTheta(){
    for(unsigned int i=0;i<4;++i){
        const double tmp=calY(i);
        theta[0]+=(y[i]-tmp)*x[i][0]*alpha;
        theta[1]+=(y[i]-tmp)*x[i][1]*alpha;
    }
}

// 计算方差
static double calVari(){
    double sum=0.0;
    for(unsigned int i=0;i<4;++i){
        const double tmp=calY(i);
        sum+=(y[i]-tmp)*(y[i]-tmp);
    }
    return(sum);
}

// 程序入口
int main(void){
    unsigned int i=0;
    // 批量梯度下降法
    for(i=0;i<iteras;++i){
        // 计算方差
        const double lastVari=calVari();
        // 计算theta
        calTheta();
        // 计算方差
        const double newVari=calVari();
        // 收敛检测
        if(fabs(lastVari-newVari)<conv){
            break;
        }
    }
    // 输出迭代结果
    printf("iteras=%d\r\n",i);
    printf("theta1=%lf\r\n",theta[0]);
    printf("theta2=%lf\r\n",theta[1]);
    // 返回
    return(0);
}