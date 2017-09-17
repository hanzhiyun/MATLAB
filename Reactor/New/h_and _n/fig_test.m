function fig_test
% scirpt for fig

D = 0.124;   % ��Ȧ��ֱ��
h = 0.0006;  % ��Ȧ���߿��
N = (100:10:400)';
H = N*h;
ns = 3*N/5; % ns�����ģ���ܵ�����
n2 = ns/3;
% p = zeros(31,1);
% n = zeros(31,1);
% q = zeros(31,1);

I1 = cell(31,1);
I2 = cell(31,1);
% temp1 ����H�� temp2 ����p�� temp3 ����n
I1_temp1 = [];
I1_temp2 = [];
I1_temp3 = [];
I2_temp1 = [];
I2_temp2 = [];
I2_temp3 = [];

data3 = [];

for i = 1:31
    filename = ['data\Q', num2str(N(i)), '.mat'];
    load(filename, 'Q');
    [~, I1{i}] = min(Q);
    [~, I2{i}] = min((Q'));
    disp(['The ', num2str(N(i)/10 - 9), 'cycle...'])
    l1 = length(I1{i});
    l2 = length(I2{i});
    % ��һ�����棬�ڹ̶�n�¶�Ӧ����������p���������
    
    I1_temp1 = [I1_temp1; H(i)*ones(l1, 1)];
    I1_temp2 = [I1_temp2; I1{i}'];
    I1_temp3 = [I1_temp3; (1:l1)'];
    % �ڶ������棬�ڹ̶�p�¶�Ӧ����������n���������
    I2_temp1 = [I2_temp1; H(i)*ones(l2, 1)];
    I2_temp2 = [I2_temp2; (1:l2)'];
    I2_temp3 = [I2_temp3; I2{i}'];
    % ��ȥ��ģ�͸���������ȵĵ�
    data3 = [data3; I1_temp1(n2(i)), h*I1_temp2(n2(i)), I1_temp3(n2(i))];
    
end

% H-P-nͼ������
% P = p*h
% H = N*h;
I1_temp2 = I1_temp2*h;
I2_temp2 = I2_temp2*h;

data1 = [ I1_temp1, I1_temp2, I1_temp3];
data2 = [ I2_temp1, I2_temp2, I2_temp3];
% H/D-rho-nͼ������
% H_D = H/D
% rho = 100*p./N
% eta = 100*n./ns
% data2 = [H_D, rho, eta]




filename = 'data\figtest.xlsx';
xlswrite(filename, data1, 1)
xlswrite(filename, data2, 2)
xlswrite(filename, data3, 3)