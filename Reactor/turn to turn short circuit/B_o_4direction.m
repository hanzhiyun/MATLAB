function [Bo_ATC, Bo_ATS, Bo_LTC, Bo_LTB] = B_o_4direction(p)
% 求出2个方向上的原模型的磁感应强度

D = 0.606;   % 线圈的直径
R = D / 2;    % 线圈的半径
h = 0.00357;  % 线圈导线宽度
N = 148;
interval = D / 5; % 各个方向上取点50 的间距大小

Bo_ATC = [];
Bo_ATS = [];
Bo_LTC = [];
Bo_LTB = [];

% ATC方向
for z = 0:-interval:-D*10
    Bo_ATC = [Bo_ATC, B_origin(0, 0, z, p)];
end

% ATS方向
for z = 0:-interval:-D*10
    Bo_ATS = [Bo_ATS, B_origin(0, R, z, p)];
end

% LTC方向
for y = R:interval:R+10*D
    Bo_LTC = [Bo_LTC, B_origin(0, y, N*h/2, p)];
end

% LTB方向
for y = R:interval:R+10*D
    Bo_LTB = [Bo_LTB, B_origin(0, y, 0, p)];
end