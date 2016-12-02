clc;clear;
A = rand(10,10);
C = rand(10,1);
tic;
X = gauss(A,C)
t1 = toc
tic;
X = A\C
t2 = toc