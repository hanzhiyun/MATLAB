function [  ] = baobao1(  )
%BAOBAO1 此处显示有关此函数的摘要
%   此处显示详细说明
%   牛顿法求解非线性方程组
format long;
x = [1.1, 2.1, 3]'; %x内元素不能相同
y = f(x)
dy = df(x);
fprintf('%d  %.7f  %.7f  %.7f\n', 0, x(1), x(2), x(3));
N = 9;
for i = 1:N
    plot(i,x(1),'ro',i,x(2),'bo',i,x(3),'go');
    hold on;
    dx = -dy\y;
    x = x + dx;
    y = f(x);
    dy = df(x);
    fprintf('%d  %.7f  %.7f  %.7f\n', i, x(1), x(2), x(3));
    if  norm(dx) < 1e-5
        break;
    else
    end
end

end

function y = f(x)
%要求的函数
y0 = [ -2.414213562373095
                   0
   2.414213562373095];
y(1) = sign(x(1) - x(2))*sqrt(abs(x(1) - x(2))) + sign(x(1) - x(3))*sqrt(abs(x(1) - x(3))) - y0(1);
y(2) = sign(x(2) - x(1))*sqrt(abs(x(2) - x(1))) + sign(x(2) - x(3))*sqrt(abs(x(2) - x(3))) - y0(2);
y(3) = sign(x(3) - x(1))*sqrt(abs(x(3) - x(1))) + sign(x(3) - x(2))*sqrt(abs(x(3) - x(2))) - y0(3);
y = [y(1), y(2), y(3)]';
end

function dy = df(x)
%要求函数的导函数
dy = [1/(2*sqrt(abs(x(1) - x(2)))) + 1/(2*sqrt(abs(x(1) - x(3)))), -1/(2*sqrt(abs(x(1) - x(2)))), -1/(2*sqrt(abs(x(1) - x(3))))
    -1/(2*sqrt(abs(x(2) - x(1)))), 1/(2*sqrt(abs(x(2) - x(1)))) + 1/(2*sqrt(abs(x(2) - x(3)))), -1/(2*sqrt(abs(x(2) - x(3))))
    -1/(2*sqrt(abs(x(3) - x(1)))), -1/(2*sqrt(abs(x(3) - x(2)))), 1/(2*sqrt(abs(x(3) - x(1)))) + 1/(2*sqrt(abs(x(3) - x(2))))];
end