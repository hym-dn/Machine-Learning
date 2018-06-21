%
% Logistic�ع��㷨
%

% ���
clc;  
clear all;  
close all;

% ������������
x=[-3;-2;-1;0;1;2;3];  
y=[0.01; 0.05;0.3; 0.45; 0.8; 1.1; 0.99];

% δ֪������
n=size(x,2);
% ��������
m=size(x,1);

% ѧϰ��
alpha=0.01;

% ϵ������
theta=0.001;

% ��������������
for k=1:10000
    % �������ۺ���
    % ...
    % ����theta
    t=0.0;
    for j=1:m
        % ���������theta
         h=1/(1+exp(-theta*x(j)));
         t=t+alpha*(y(j)-h)*x(j);
    end
    theta=theta+t;
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
% ����x��y����
data(:,1)=x;
data(:,2)=y;  
data=sortrows(data,1);
x=data(:,1);
y=data(:,2);
% ����x��y����
plot(x,y);
% ��ӡ���ϵ��
fprintf('theta=%f;\n',theta); 


