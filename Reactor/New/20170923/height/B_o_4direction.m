function [Bo_ATC, Bo_ATS, Bo_LTC, Bo_LTB] = B_o_4direction(N)
% 求出四个方向上的原模型的磁感应强度

D = 0.124;   % 线圈的直径
R = D / 2;    % 线圈的半径
h = 0.0006;  % 线圈导线宽度
interval = D / 50; % 各个方向上取点50 的间距大小

Bo_ATC = [];
Bo_ATS = [];
Bo_LTC = [];
Bo_LTB = [];

% ATC方向
for z = 0:-interval:-D
    Bo_ATC = [Bo_ATC, B_origin(0, 0, z, N)];
end

% ATS方向
for z = 0-N*h/20:-interval:-D-N*h/20
    Bo_ATS = [Bo_ATS, B_origin(0, R, z, N)];
end

% LTC方向
for y = R+N*h/4:interval:R+D+N*h/4
    Bo_LTC = [Bo_LTC, B_origin(0, y, N*h/2, N)];
end

% LTB方向
for y = R+N*h/30:interval:R+D+N*h/30
    Bo_LTB = [Bo_LTB, B_origin(0, y, 0, N)];
end