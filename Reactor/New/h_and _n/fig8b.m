function fig8b
% scirpt for fig8b

D = 0.124;   % ��Ȧ��ֱ��
h = 0.0006;  % ��Ȧ���߿��
N = (100:10:400)';
ns = 3*N/5; % ns�����ģ���ܵ�����
p = zeros(31,1);
n = zeros(31,1);
q = zeros(31,1);
for i = 1:31
    filename = ['data\Q', num2str(N(i)), '.mat'];
    load(filename, 'Q');
    q(i) = min(Q(:));
    [p(i), n(i)] = find(Q == q(i));
    disp(['The ', num2str(N(i)/10 - 9), 'cycle...']);
end

% H-P-nͼ������
P = p*h
H = N*h
data1 = [H, P, n, p]
% H/D-rho-nͼ������

H_D = H/D
rho = 100*p./N
eta = 100*n./ns
data2 = [H_D, rho, eta]

filename = 'data\fig8b.xlsx';
xlswrite(filename, data1, 1)
xlswrite(filename, data2, 2)