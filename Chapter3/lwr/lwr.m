%%
% �ֲ���Ȩ���Իع�
%%

% ���ȫ������
clc;
clear all;  
close all;

% 
%  ��ȡ�����ļ�
%
load('data.txt');

%
%  ��ȡx��y����
%
x=data(:,1:2);
y=data(:,3);

%
%  ��ȡx�����С���
%
m=size(x,1);  % ��
n=size(x,2);  % ��

%  Ȩ�ؾ���
w=zeros(m,m); 

% ϵ������
theta=zeros(n,m);

% ����
k=0.05;

% ��m������������ÿ�������Ļع�ϵ��
for i=1:m
    % ����Ȩ�ؾ���
    for j=1:m  % ����m�Ŀ���ȡ��С��ֵ
        w(j,j)=exp(-((x(j,2)-x(i,2))^2)/(2*k^2));  
    end
    % ����theta
    theta(:,i)=((x'*w*x)\x')*w*y; % ���淽����  
end

%%
% ��ʾ���
%%
% ����һ���������
figure;
% ��ɫ��ʾԭʼ����
plot(x(:,2),y,'r.');
% �ǵ�ǰ�ἰͼ�񱣳ֶ�����ˢ�£�
% ׼�����ܴ˺󽫻��Ƶ�ͼ��
hold on;  
% ����y
y_fit=x*theta;  
% �����Խ��߾���
y=diag(y_fit); 
% �洢x
data(:,1:2)=x;
% �洢�����y
data(:,3)=y;
% ���ڶ�������
data=sortrows(data,2);
% ��ȡx��y
x=data(:,1:2);  
y=data(:,3);
% ����x��y
plot(x(:,2),y);  