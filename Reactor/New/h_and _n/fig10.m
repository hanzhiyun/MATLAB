function fig10
% script for fig10
D = 0.124;   % 线圈的直径
h = 0.0006;  % 线圈导线宽度

readfile = 'data\fig8b.xlsx';
writefile = 'data\fig10.xlsx';
p = xlsread(readfile, 1, 'D1:D31');
n = xlsread(readfile, 1, 'C1:C31');
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
    % 求出四个方向上的原模型的磁感应强度
    [Bo_ATC, Bo_ATS, Bo_LTC, Bo_LTB] = B_o_4direction(N(i));
    Bo = [Bo_ATC, Bo_ATS, Bo_LTC, Bo_LTB];
    % 求出四个方向上的简化模型的磁感应强度
    [Br_ATC, Br_ATS, Br_LTC, Br_LTB] = B_r_4direction(N(i), p(i), n(i));
    Br = [Br_ATC, Br_ATS, Br_LTC, Br_LTB];
    
    % MAPE
    M_ATC(i) = MAPE(Bo_ATC, Br_ATC);
    M_ATS(i) = MAPE(Bo_ATS, Br_ATS);
    M_LTC(i) = MAPE(Bo_LTC, Br_LTC);
    M_LTB(i) = MAPE(Bo_LTB, Br_LTB);
    M(i) = MAPE(Bo, Br);
    
%     M(i) = NRMSD(Bo, Br);
    % 确定系数
%     R(i) = R_square(Bo, Br);
end
% M = (M_ATC + M_ATS + M_LTC + M_LTB)./4;
M
% data = [H_D, M, R];
% data2 = [H_D, M_ATC, M_ATS, M_LTC, M_LTB];
% xlswrite(writefile, data, 1);
% xlswrite(writefile, data2, 2);