%%
% 局部加权线性回归
%%

% 清除全部命令
clc;
clear all;  
close all;

% 
%  读取数据文件
%
load('data.txt');

%
%  提取x、y样本
%
x=data(:,1:2);
y=data(:,3);

%
%  获取x矩阵行、列
%
m=size(x,1);  % 行
n=size(x,2);  % 列

%  权重矩阵
w=zeros(m,m); 

% 系数矩阵
theta=zeros(n,m);

% 波长
k=0.05;

% 对m个样本，计算每个样本的回归系数
for i=1:m
    % 计算权重矩阵
    for j=1:m  % 这里m的可以取更小的值
        w(j,j)=exp(-((x(j,2)-x(i,2))^2)/(2*k^2));  
    end
    % 计算theta
    theta(:,i)=((x'*w*x)\x')*w*y; % 正规方程组  
end

%%
% 显示结果
%%
% 创建一个输出窗口
figure;
% 红色显示原始数据
plot(x(:,2),y,'r.');
% 是当前轴及图像保持而不被刷新，
% 准备接受此后将绘制的图形
hold on;  
% 计算y
y_fit=x*theta;  
% 创建对角线矩阵
y=diag(y_fit); 
% 存储x
data(:,1:2)=x;
% 存储计算的y
data(:,3)=y;
% 按第二列排序
data=sortrows(data,2);
% 获取x、y
x=data(:,1:2);  
y=data(:,3);
% 绘制x、y
plot(x(:,2),y);  