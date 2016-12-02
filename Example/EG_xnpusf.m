%辛普森法则计算积分
clear;
clc;
A = 0;
B = 10;
N = 100;
dx = (B - A)/N;
x = A:dx:B;
f = x.^3 + 3.2*x.^2 - 3.4*x + 20.2;
sum_even = 0.0;
for i = 2:2:N
    sum_even = sum_even + f(i);
end
sum_odd = 0.0;
for i = 3:2:N
    sum_odd = sum_odd + f(i);
end
I = dx/3*(f(1) + 4*sum_even + 2*sum_odd + f(N+1));
disp(I);
