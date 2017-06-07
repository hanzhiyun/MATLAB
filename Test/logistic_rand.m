function x = logistic_rand(x)
% 使用混沌算法产生随机数
k = 3.99;
for i = 1:100
    x = k*x*(1 - x);
end