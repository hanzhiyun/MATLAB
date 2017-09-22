function [Br_ATC, Br_ATS, Br_LTC, Br_LTB] = B_r_4direction(N, p)
% ����ĸ������ϵļ�ģ�͵ĴŸ�Ӧǿ��

D = 0.124;   % ��Ȧ��ֱ��
R = D / 2;    % ��Ȧ�İ뾶
h = 0.0006;  % ��Ȧ���߿��
interval = D / 50; % ����������ȡ��50 �ļ���С

Br_ATC = [];
Br_ATS = [];
Br_LTC = [];
Br_LTB = [];

% ATC����
for z = 0:-interval:-D
    Br_ATC = [Br_ATC, B_ring3(0, 0, z, N, p)];
end

% ATS����
for z = 0-N*h/20:-interval:-D-N*h/20
    Br_ATS = [Br_ATS, B_ring3(0, R, z, N, p)];
end

% LTC����
for y = R+N*h/4:interval:R+D+N*h/4
    Br_LTC = [Br_LTC, B_ring3(0, y, N*h/2, N, p)];
end

% LTB����
for y = R+N*h/30:interval:R+D+N*h/30
    Br_LTB = [Br_LTB, B_ring3(0, y, 0, N, p)];
end