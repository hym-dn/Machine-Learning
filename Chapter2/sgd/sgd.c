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
static const double alpha=0.01;
// 收敛界限
static const double conv=0.0000001;
// 迭代上限
static const unsigned int iteras=10000;

// 计算y
static double calY(const unsigned int i){
    return(x[i][0]*theta[0]+x[i][1]*theta[1]);
}

// 计算theta
static void calTheta(const unsigned int i){
    const double tmp=calY(i);
    theta[0]+=(y[i]-tmp)*x[i][0]*alpha;
    theta[1]+=(y[i]-tmp)*x[i][1]*alpha;
}

// 程序入口
int main(void){
    unsigned int i=0;
    // 随即梯度下降法
    for(i=0;i<iteras;++i){
        const int m=i%4;
        // 存储theta
        const double oldTheta1=theta[0];
        const double oldTheta2=theta[1];
        // 计算theta
        calTheta(m);
        // 存储新theta
        const double newTheta1=theta[0];
        const double newTheta2=theta[1];
        // 收敛检测
        if((fabs(newTheta1-oldTheta1)<conv)&&
            (fabs(newTheta2-oldTheta2)<conv)){
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