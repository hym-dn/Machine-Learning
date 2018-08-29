% 初始化命令行
clear;clc
format;
% 迭代初始值
x0=[0 0];
% 精度要求
eps=0.00001;
% 牛顿法迭代
for i=1:10000
    % 计算方程组值
    f=double(subs(equ(x0),{'x1' 'x2'},{x0(1) x0(2)}));
    % 计算方程组导数（雅可比矩阵）
    df=double(subs(deriv(x0),{'x1' 'x2'},{x0(1) x0(2)}));
    % 更新x
    x=x0-f/df;
    % 收敛检测
    if(abs(x-x0)<eps)
        break;
    end
    % 更新迭代结果
    x0=x;
end
% 显示计算结果
disp('定位坐标：');
x
disp('迭代次数：');
i