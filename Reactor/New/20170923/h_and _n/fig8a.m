function fig8a
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

I = cell(31,1);

% temp1 ����H�� temp2 ����p�� temp3 ����n
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
   
    % ��һ�����棬�ڹ̶�n�¶�Ӧ����������p���������
    tmpH = H(i)*ones(l1, 1);
    tmpp = h*I{i}';
    tmpn = (1:l1)';
    temp1 = [temp1; tmpH];
    temp2 = [temp2; tmpp];
    temp3 = [temp3; tmpn];

    % ��ȥ��ģ�͸���������ȵĵ�
    data2 = [data2; tmpH(n2(i)), tmpp(n2(i)), tmpn(n2(i))];
    
end

% H-P-nͼ������
% P = p*h
% H = N*h;


data1 = [ temp1, temp2, temp3];

% H/D-rho-nͼ������
% H_D = H/D
% rho = 100*p./N
% eta = 100*n./ns
% data2 = [H_D, rho, eta]




filename = 'data\fig8a.xlsx';
xlswrite(filename, data1, 1)
xlswrite(filename, data2, 2)
