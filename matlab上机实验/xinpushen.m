function [I t] = xinpushen(N)
%辛普森法则计算积分
tic;
A = 1;
B = 6;
dx = (B - A)/N;
x = A:dx:B;
f = 2 + sin(2*sqrt(x));
sum_even = 0.0;
for i = 2:2:N
    sum_even = sum_even + f(i);
end
sum_odd = 0.0;
for i = 3:2:N
    sum_odd = sum_odd + f(i);
end
I = dx/3*(f(1) + 4*sum_even + 2*sum_odd + f(N+1));
t = toc;