%
% Logistic�ع��㷨
%

% ���
clc;  
clear all;  
close all;

% ������������
x=1:4;
x=x';
y=[1.15 2.24 2.76 3.81]';

% δ֪������
n=size(x,2); % 1
% ��������
m=size(x,1); % 4

% ѧϰ��
alpha=0.1;

% ϵ������
theta=0.001;

% ��������������
for k=1:10000
    % �������ۺ���
    % ...
    % ����theta
    t=0.0;
    for i=1:m
        % ���������theta
         h=1/(1+exp(-x(i)*theta));
         t=t+alpha*(y(i)-h)*x(i);
    end
    theta=theta+t
    % �������ۺ���
    % ...
    % �������
    % ...
end

%%
% ���ƽ��
%%
% ��������
figure;  
% ����ԭʼ����
plot(x,y,'r.');%ԭʼ����
% �ȴ��µĻ���
hold on;
% ����y
for j=1:m 
    y(j)=1/(1+exp(-(x(j)*theta)));
end

data(:,1)=x;
data(:,2)=y;  
data=sortrows(data,1)
x=data(:,1);
y=data(:,2);  
plot(x,y);    
fprintf('theta=%f;\n',theta);%��ӡ���ƵĲ���  


