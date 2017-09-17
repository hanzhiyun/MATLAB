function fig_test
% scirpt for fig

D = 0.124;   % 线圈的直径
h = 0.0006;  % 线圈导线宽度
N = (100:10:400)';
H = N*h;
ns = 3*N/5; % ns代表简化模型总的匝数
n2 = ns/3;
% p = zeros(31,1);
% n = zeros(31,1);
% q = zeros(31,1);

I1 = cell(31,1);
I2 = cell(31,1);
% temp1 代表H， temp2 代表p， temp3 代表n
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
    % 第一个曲面，在固定n下对应的所有最优p的情况集合
    
    I1_temp1 = [I1_temp1; H(i)*ones(l1, 1)];
    I1_temp2 = [I1_temp2; I1{i}'];
    I1_temp3 = [I1_temp3; (1:l1)'];
    % 第二个曲面，在固定p下对应的所有最优n的情况集合
    I2_temp1 = [I2_temp1; H(i)*ones(l2, 1)];
    I2_temp2 = [I2_temp2; (1:l2)'];
    I2_temp3 = [I2_temp3; I2{i}'];
    % 出去简化模型各环匝数相等的点
    data3 = [data3; I1_temp1(n2(i)), h*I1_temp2(n2(i)), I1_temp3(n2(i))];
    
end

% H-P-n图像数据
% P = p*h
% H = N*h;
I1_temp2 = I1_temp2*h;
I2_temp2 = I2_temp2*h;

data1 = [ I1_temp1, I1_temp2, I1_temp3];
data2 = [ I2_temp1, I2_temp2, I2_temp3];
% H/D-rho-n图像数据
% H_D = H/D
% rho = 100*p./N
% eta = 100*n./ns
% data2 = [H_D, rho, eta]




filename = 'data\figtest.xlsx';
xlswrite(filename, data1, 1)
xlswrite(filename, data2, 2)
xlswrite(filename, data3, 3)