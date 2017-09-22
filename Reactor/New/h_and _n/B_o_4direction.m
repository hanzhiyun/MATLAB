function [Bo_ATC, Bo_ATS, Bo_LTC, Bo_LTB] = B_o_4direction(N)
% ����ĸ������ϵ�ԭģ�͵ĴŸ�Ӧǿ��

D = 0.124;   % ��Ȧ��ֱ��
R = D / 2;    % ��Ȧ�İ뾶
h = 0.0006;  % ��Ȧ���߿��
interval = D / 50; % ����������ȡ��50 �ļ���С

Bo_ATC = [];
Bo_ATS = [];
Bo_LTC = [];
Bo_LTB = [];

% ATC����
for z = 0:-interval:-D
    Bo_ATC = [Bo_ATC, B_origin(0, 0, z, N)];
end

% ATS����
for z = 0-N*h/20:-interval:-D-N*h/20
    Bo_ATS = [Bo_ATS, B_origin(0, R, z, N)];
end

% LTC����
for y = R+N*h/4:interval:R+D+N*h/4
    Bo_LTC = [Bo_LTC, B_origin(0, y, N*h/2, N)];
end

% LTB����
for y = R+N*h/30:interval:R+D+N*h/30
    Bo_LTB = [Bo_LTB, B_origin(0, y, 0, N)];
end