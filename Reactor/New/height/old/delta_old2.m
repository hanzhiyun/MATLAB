function delta = delta(N)
% 求最优简化模型过程中的误差

%开启并行计算
pool = startmatlabpool(3); 

% N = 100;
% p = 34;
D = 0.124;   % 线圈的直径
R = D / 2;    % 线圈的半径
h = 0.0006;  % 线圈导线宽度
interval = D / 50; % 各个方向上取点50 的间距大小

% 四个方向上的平方损失函数值
Q_ATC = [];
Q_ATS = [];
Q_LTC = [];
Q_LTB = [];

% 四个方向上的MAPE
M_ATC = [];
M_ATS = [];
M_LTC = [];
M_LTB = [];

% 求出四个方向上的原模型的磁感应强度
[Bo_ATC, Bo_ATS, Bo_LTC, Bo_LTB] = B_o_4direction(N);

parfor p = 1:N/2
    err_ATC = [];
    err_ATS = [];
    err_LTC = [];
    err_LTB = [];
    
    % ATC方向
    i = 0;
    for z = 0:-interval:-D
        i = i + 1;
        B_r3 = B_ring3(0, 0, z, N, p);
        err_ATC = [err_ATC, abs(Bo_ATC(i) - B_r3)]
    end
    
    % ATS方向
    i = 0;
    for z = 0:-interval:-D
        i = i + 1;
        B_r3 = B_ring3(0, R, z, N, p);
        err_ATS = [err_ATS, abs(Bo_ATS(i) - B_r3)];
    end
    
    % LTC方向
    i = 0;
    for y = R:interval:R+D
        i = i + 1;
        B_r3 = B_ring3(0, y, N*h/2, N, p);
        err_LTC = [err_LTC, abs(Bo_LTC(i) - B_r3)];
    end
%     err_LTC
    % LTB方向
    i = 0;
    for y = R:interval:R+D
        i = i + 1;
        B_r3 = B_ring3(0, y, 0, N, p);
        err_LTB = [err_LTB, abs(Bo_LTB(i) - B_r3)];
    end
    
    Q_ATC = [Q_ATC, least_squares(err_ATC)];
    Q_ATS = [Q_ATS, least_squares(err_ATS)];
    Q_LTC = [Q_LTC, least_squares(err_LTC)];
    Q_LTB = [Q_LTB, least_squares(err_LTB)];
    
    M_ATC = [M_ATC, MAPE(err_ATC, Bo_ATC)];
    M_ATS = [M_ATS, MAPE(err_ATS, Bo_ATS)];
    M_LTC = [M_LTC, MAPE(err_LTC, Bo_LTC)];
    M_LTB = [M_LTB, MAPE(err_LTB, Bo_LTB)];
    
end

% 整体的平方损失函数与平均绝对误差百分比
Q = Q_ATC + Q_ATS + Q_LTC + Q_LTB;
M = (M_ATC + M_ATS + M_LTC + M_LTB)./4;

% 保存数据
filename = ['data', num2str(N), '.mat'];
save(filename, 'Q_ATC', 'Q_ATS', 'Q_LTC', 'Q_LTB');
save(filename, 'M_ATC', 'M_ATS', 'M_LTC', 'M_LTB', '-append');

figure(1);
p = 1:N/2;
plot(p, Q_ATC, p, Q_ATS, p, Q_LTC, p, Q_LTB);
hold on;
plot(p, Q);
legend('Q_{ATC}', 'Q_{ATS}', 'Q_{LTC}', 'Q_{LTB}', 'Q');

figure(2);
p = 1:N/2;
plot(p, M_ATC, p, M_ATS, p, M_LTC, p, M_LTB);
hold on;
plot(p, M);
legend('M_{ATC}', 'M_{ATS}', 'M_{LTC}', 'M_{LTB}', 'M');

[q_ATC, p_ATC] = min(Q_ATC)
[q_ATS, p_ATS] = min(Q_ATS)
[q_LTC, p_LTC] = min(Q_LTC)
[q_LTB, p_LTB] = min(Q_LTB)
[q, p] = min(Q)

min_M_ATC = M_ATC(p_ATC)
min_M_ATS = M_ATS(p_ATS)
min_M_LTC = M_LTC(p_LTC)
min_M_LTB = M_LTB(p_LTB)
min_M = M(p)
%关闭并行计算
closematlabpool;  
