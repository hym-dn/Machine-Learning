%
% �Է�������
% x - �����xֵ����
%
function df=deriv(x);
% ��ȡ������
f=equ(x);
% ��������
df=[diff(f,'x1');diff(f,'x2')];