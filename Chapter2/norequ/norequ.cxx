/**
 * 正规方程组测试代码
 * y=x1*theta1+x2*theta2
 */

#include<armadillo> 

int main(void){
    // 初始化x样本
    arma::Mat<double> x;
    x<<1.0<<4.0<<arma::endr
     <<2.0<<5.0<<arma::endr
     <<5.0<<1.0<<arma::endr
     <<4.0<<2.0;
    // 初始化y样本
    arma::Col<double> y;
    y<<19.0<<arma::endr
     <<26.0<<arma::endr
     <<19.0<<arma::endr
     <<20.0;
    // 求解正规方程组 
    arma::Mat<double> left=x.t()*x;
    arma::Col<double> right=x.t()*y;
    arma::Col<double> theta=
        arma::solve(left,right);
    // 打印theta
    theta.print();
    // 返回
    return(0);
}