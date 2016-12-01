% test for homework 4-2
clc;clear;
syms a11 a12 a21 a22;
Y = [2*a11, 2*a21, 0
    a12, a11 + a22, a21
    0, 2*a12, 2*a22]
X = [-1; 0; -1]
% P = inv(Y) * X
P = Y \ X