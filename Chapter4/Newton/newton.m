% ��ʼ��������
clear;clc
format;
% ������ʼֵ
x0=[0 0];
% ����Ҫ��
eps=0.00001;
% ţ�ٷ�����
for i=1:10000
    % ���㷽����ֵ
    f=double(subs(equ(x0),{'x1' 'x2'},{x0(1) x0(2)}));
    % ���㷽���鵼�����ſɱȾ���
    df=double(subs(deriv(x0),{'x1' 'x2'},{x0(1) x0(2)}));
    % ����x
    x=x0-f/df;
    % �������
    if(abs(x-x0)<eps)
        break;
    end
    % ���µ������
    x0=x;
end
% ��ʾ������
disp('��λ���꣺');
x
disp('����������');
i