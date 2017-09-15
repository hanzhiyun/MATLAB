function [Br_ATC, Br_ATS, Br_LTC, Br_LTB] = B_r_4direction(N, p, n)
% 求出四个方向上的简化模型的磁感应强度

D = 0.124;   % 线圈的直径
R = D / 2;    % 线圈的半径
h = 0.0006;  % 线圈导线宽度
interval = D / 50; % 各个方向上取点50 的间距大小

Br_ATC = [];
Br_ATS = [];
Br_LTC = [];
Br_LTB = [];

% ATC方向
for z = 0:-interval:-D
    Br_ATC = [Br_ATC, B_ring3_n(0, 0, z, N, p, n)];
end

% ATS方向
for z = 0:-interval:-D
    Br_ATS = [Br_ATS, B_ring3_n(0, R, z, N, p, n)];
end

% LTC方向
for y = R+D/10:interval:R+D
    Br_LTC = [Br_LTC, B_ring3_n(0, y, N*h/2, N, p, n)];
end

% LTB方向
for y = R+D/10:interval:R+D
    Br_LTB = [Br_LTB, B_ring3_n(0, y, 0, N, p, n)];
end