function x = logistic_rand(x)
% ʹ�û����㷨���������
k = 3.99;
for i = 1:100
    x = k*x*(1 - x);
end