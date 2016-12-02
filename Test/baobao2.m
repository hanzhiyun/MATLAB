function [  ] = baobao2(  )
%BAOBAO2 此处显示有关此函数的摘要
%   此处显示详细说明
%   牛顿法求解非线性方程组
format long;
x = [1, 13, 14]'; %x内元素不能相同
y = [ -13
                   0
   2.414213562373095];
f = F(x, y);
df = dF(x);
fprintf('%d  %.7f  %.7f  %.7f\n', 0, y(1), x(2), x(3));
y1 = [y(1)];
x2 = [x(2)];
x3 = [x(3)];
N = 9;
for i = 1:N
    dx = -df\f;
    y(1) = y(1) + dx(1);
    x(2) = x(2) + dx(2);
    x(3) = x(3) + dx(3);
    y1 = [y1,y(1)];
    x2 = [x2,x(2)];
    x3 = [x3,x(3)];
    f = F(x,y);
    df = dF(x);
    fprintf('%d  %.7f  %.7f  %.7f\n', i,y(1), x(2), x(3));
    if  norm(dx) < 1e-5
        break;
    else
    end
end
i = 0:N;
hold on;
plot(i,y1,'-ro');
plot(i,x2,'-bo');
plot(i,x3,'-go');
end

function f = F(x, y)
%要求的函数
f(1) = sign(x(1) - x(2))*sqrt(abs(x(1) - x(2))) + sign(x(1) - x(3))*sqrt(abs(x(1) - x(3))) - y(1);
f(2) = sign(x(2) - x(1))*sqrt(abs(x(2) - x(1))) + sign(x(2) - x(3))*sqrt(abs(x(2) - x(3))) - y(2);
f(3) = sign(x(3) - x(1))*sqrt(abs(x(3) - x(1))) + sign(x(3) - x(2))*sqrt(abs(x(3) - x(2))) - y(3);
f = [f(1), f(2), f(3)]';
end

function df = dF(x)
%要求函数的导函数
df = [-1, -1/(2*sqrt(abs(x(1) - x(2)))), -1/(2*sqrt(abs(x(1) - x(3))))
    0, 1/(2*sqrt(abs(x(2) - x(1)))) + 1/(2*sqrt(abs(x(2) - x(3)))), -1/(2*sqrt(abs(x(2) - x(3))))
    0, -1/(2*sqrt(abs(x(3) - x(2)))), 1/(2*sqrt(abs(x(3) - x(1)))) + 1/(2*sqrt(abs(x(3) - x(2))))];
end