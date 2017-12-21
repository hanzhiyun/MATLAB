function fig8a
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

I = cell(31,1);

% temp1 代表H， temp2 代表p， temp3 代表n
temp1 = [];
temp2 = [];
temp3 = [];


data2 = [];

for i = 1:31
    filename = ['data\Q', num2str(N(i)), '.mat'];
    load(filename, 'Q');
    [~, I{i}] = min(Q);
   
    disp(['The ', num2str(N(i)/10 - 9), 'cycle...'])
    l1 = length(I{i});
   
    % 第一个曲面，在固定n下对应的所有最优p的情况集合
    tmpH = H(i)*ones(l1, 1);
    tmpp = h*I{i}';
    tmpn = (1:l1)';
    temp1 = [temp1; tmpH];
    temp2 = [temp2; tmpp];
    temp3 = [temp3; tmpn];

    % 出去简化模型各环匝数相等的点
    data2 = [data2; tmpH(n2(i)), tmpp(n2(i)), tmpn(n2(i))];
    
end

% H-P-n图像数据
% P = p*h
% H = N*h;


data1 = [ temp1, temp2, temp3];

% H/D-rho-n图像数据
% H_D = H/D
% rho = 100*p./N
% eta = 100*n./ns
% data2 = [H_D, rho, eta]




filename = 'data\fig8a.xlsx';
xlswrite(filename, data1, 1)
xlswrite(filename, data2, 2)
