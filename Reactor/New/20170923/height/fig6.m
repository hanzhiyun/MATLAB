% scirpt for fig6
clc;
clear;
D = 0.124;   % 线圈的直径
R = D / 2;    % 线圈的半径
h = 0.0006;  % 线圈导线宽度
p = zeros(31,1);
q = zeros(31,1);
for i = 1:31
    n = 90 + 10*i;
    filename = ['data\Q', num2str(n), '.mat'];
    load(filename, 'Q');
    [q(i), p(i)] = min(Q);
end

% H-P图像数据
P = p*h
N = (100:10:400)'
H = N*h
data1 = [H, P]
% H/D-rho图像数据
H_D = H/D
rho = p./N
data2 = [H_D, rho]

filename = 'data\fig6.xlsx';
xlswrite(filename, data1, 1)
xlswrite(filename, data2, 2)
