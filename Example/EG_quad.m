%用quad函数计算积分
clear;
clc;
f1 = @(x)(x.^3 + 3.2*x.^2 - 3.4*x + 20.2);
A = 0.0;
B = 10.0;
I = quad(f1,A,B);
disp(I);