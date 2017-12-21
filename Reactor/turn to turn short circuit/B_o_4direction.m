function [Bo_ATC, Bo_ATS, Bo_LTC, Bo_LTB] = B_o_4direction(p)
% ���2�������ϵ�ԭģ�͵ĴŸ�Ӧǿ��

D = 0.606;   % ��Ȧ��ֱ��
R = D / 2;    % ��Ȧ�İ뾶
h = 0.00357;  % ��Ȧ���߿��
N = 148;
interval = D / 5; % ����������ȡ��50 �ļ���С

Bo_ATC = [];
Bo_ATS = [];
Bo_LTC = [];
Bo_LTB = [];

% ATC����
for z = 0:-interval:-D*10
    Bo_ATC = [Bo_ATC, B_origin(0, 0, z, p)];
end

% ATS����
for z = 0:-interval:-D*10
    Bo_ATS = [Bo_ATS, B_origin(0, R, z, p)];
end

% LTC����
for y = R:interval:R+10*D
    Bo_LTC = [Bo_LTC, B_origin(0, y, N*h/2, p)];
end

% LTB����
for y = R:interval:R+10*D
    Bo_LTB = [Bo_LTB, B_origin(0, y, 0, p)];
end