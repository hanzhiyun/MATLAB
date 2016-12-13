%the test for homework
clc;clear;
%5-5
% A = [-2 1 0 0 0
%         0 -2 1 0 0
%         0 0 -2 0 0
%         0 0 0 -5 1
%         0 0 0 0 -5]
% b = [4;5;0;7;0]
% Is_controllable(A, b)

%5-6
A = [0 1 0 0
        0 0 -1 0
        0 0 0 1
        0 0 11 0]
b = [0 1 0 -1]'
Is_controllable(A, b)