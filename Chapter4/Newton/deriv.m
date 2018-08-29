%
% 对方程组求导
% x - 输入的x值矩阵
%
function df=deriv(x);
% 获取方程组
f=equ(x);
% 方程组求导
df=[diff(f,'x1');diff(f,'x2')];