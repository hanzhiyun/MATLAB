function [err2] = least_squares(err)
% 最小二乘法
% 各个误差的平方后求和
err2 = err * err';