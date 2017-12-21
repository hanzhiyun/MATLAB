% scirpt for fig6
clc;
clear;
D = 0.124;   % ��Ȧ��ֱ��
R = D / 2;    % ��Ȧ�İ뾶
h = 0.0006;  % ��Ȧ���߿��
p = zeros(31,1);
q = zeros(31,1);
for i = 1:31
    n = 90 + 10*i;
    filename = ['data\Q', num2str(n), '.mat'];
    load(filename, 'Q');
    [q(i), p(i)] = min(Q);
end

% H-Pͼ������
P = p*h
N = (100:10:400)'
H = N*h
data1 = [H, P]
% H/D-rhoͼ������
H_D = H/D
rho = p./N
data2 = [H_D, rho]

filename = 'data\fig6.xlsx';
xlswrite(filename, data1, 1)
xlswrite(filename, data2, 2)
