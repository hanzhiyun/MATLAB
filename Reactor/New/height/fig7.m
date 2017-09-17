function fig7
% script for fig7
D = 0.124;   % ��Ȧ��ֱ��
h = 0.0006;  % ��Ȧ���߿��

readfile = 'data\fig6.xlsx';
writefile = 'data\fig7.xlsx';
P = xlsread(readfile, 1, 'B1:B31');
p = P/h;
N = (100:10:400)';
H = N*h;
H_D = H/D;
M_ATC = zeros(31,1);
M_ATS = zeros(31,1);
M_LTC = zeros(31,1);
M_LTB = zeros(31,1);
M = zeros(31,1);
R = zeros(31,1);
parfor i = 1:31
    N = 90 + 10*i;
    % ����ĸ������ϵ�ԭģ�͵ĴŸ�Ӧǿ��
    [Bo_ATC, Bo_ATS, Bo_LTC, Bo_LTB] = B_o_4direction(N);
    Bo = [Bo_ATC, Bo_ATS, Bo_LTC, Bo_LTB];
    % ����ĸ������ϵļ�ģ�͵ĴŸ�Ӧǿ��
    [Br_ATC, Br_ATS, Br_LTC, Br_LTB] = B_r_4direction(N, p(i));
    Br = [Br_ATC, Br_ATS, Br_LTC, Br_LTB];
    
    % MAPE
    M_ATC(i) = MAPE(Bo_ATC, Br_ATC);
    M_ATS(i) = MAPE(Bo_ATS, Br_ATS);
    M_LTC(i) = MAPE(Bo_LTC, Br_LTC);
    M_LTB(i) = MAPE(Bo_LTB, Br_LTB);
    M(i) = MAPE(Bo, Br);
    % ȷ��ϵ��
    R(i) = R_square(Bo, Br);
end
% M = (M_ATC + M_ATS + M_LTC + M_LTB)./4;

data = [H_D, M, R];
data2 = [H_D, M_ATC, M_ATS, M_LTC, M_LTB];
xlswrite(writefile, data, 1);
xlswrite(writefile, data2, 2);
    

%{
%% �о��Ǹ�������ֵ����ƫ������
% ����ĸ������ϵ�ԭģ�͵ĴŸ�Ӧǿ��
[Bo_ATC, Bo_ATS, Bo_LTC, Bo_LTB] = B_o_4direction(390);
Bo = [Bo_ATC, Bo_ATS, Bo_LTC, Bo_LTB];
% ����ĸ������ϵļ�ģ�͵ĴŸ�Ӧǿ��
[Br_ATC, Br_ATS, Br_LTC, Br_LTB] = B_r_4direction(390, p(30));
Br = [Br_ATC, Br_ATS, Br_LTC, Br_LTB];
M = MAPE(Bo, Br)
% MAPE
% M_ATC = MAPE(Bo_ATC, Br_ATC)
% M_ATS = MAPE(Bo_ATS, Br_ATS)
% M_LTC = MAPE(Bo_LTC, Br_LTC)
% M_LTB = MAPE(Bo_LTB, Br_LTB)
% M = (M_ATC + M_ATS + M_LTC + M_LTB)./4

figure(5);
plot(Bo);
hold on;
plot(Br);
legend('Bo', 'Br')
%}











