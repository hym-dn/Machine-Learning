%
% Logistic回归算法
%

% 清除
clc;  
clear all;  
close all;

% 创建样本数据
x=[-3;-2;-1;0;1;2;3];  
y=[0.01; 0.05;0.3; 0.45; 0.8; 1.1; 0.99];

% 未知数个数
n=size(x,2);
% 样本个数
m=size(x,1);

% 学习率
alpha=0.01;

% 系数向量
theta=0.001;

% 最大迭代次数限制
for k=1:10000
    % 计算评价函数
    % ...
    % 计算theta
    t=0.0;
    for j=1:m
        % 计算更新新theta
         h=1/(1+exp(-theta*x(j)));
         t=t+alpha*(y(j)-h)*x(j);
    end
    theta=theta+t;
    % 计算评价函数
    % ...
    % 收敛检测
    % ...
end

%%
% 绘制结果
%%
% 创建窗口
figure;  
% 绘制原始数据
plot(x,y,'r.');%原始数据
% 等待新的绘制
hold on;
% 计算y
for j=1:m 
    y(j)=1/(1+exp(-(x(j)*theta)));
end
% 整理x、y数据
data(:,1)=x;
data(:,2)=y;  
data=sortrows(data,1);
x=data(:,1);
y=data(:,2);
% 绘制x、y数据
plot(x,y);
% 打印拟合系数
fprintf('theta=%f;\n',theta); 


