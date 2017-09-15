function [] = delta_np(N)
% 求最优简化模型过程中的误差

%开启并行计算
% pool = startmatlabpool(4);
% 循环次数
cnt_p = N/2;        % 简化模型高度对应的匝数值范围 
cnt_n = 3*N/5-2;  % 简化模型中间环匝数的最大可能值 

% 四个方向上的平方损失函数值
Q_ATC = zeros(cnt_p, cnt_n);
Q_ATS = zeros(cnt_p, cnt_n);
Q_LTC = zeros(cnt_p, cnt_n);
Q_LTB = zeros(cnt_p, cnt_n);

% 求出四个方向上的原模型的磁感应强度
[Bo_ATC, Bo_ATS, Bo_LTC, Bo_LTB] = B_o_4direction(N);

for p = 1:cnt_p    
    for n = 1:cnt_n
        % 求出四个方向上的简化模型的磁感应强度
        [Br_ATC, Br_ATS, Br_LTC, Br_LTB] = B_r_4direction(N, p, n);
        
        err_ATC = abs(Bo_ATC - Br_ATC);
        err_ATS = abs(Bo_ATS - Br_ATS);
        err_LTC = abs(Bo_LTC - Br_LTC);
        err_LTB = abs(Bo_LTB - Br_LTB);
        
        Q_ATC(p, n) = least_squares(err_ATC);
        Q_ATS(p, n) = least_squares(err_ATS);
        Q_LTC(p, n) = least_squares(err_LTC);
        Q_LTB(p, n) = least_squares(err_LTB);
    end
end

% 整体的平方损失函数与平均绝对误差百分比
Q = Q_ATC + Q_ATS + Q_LTC + Q_LTB;

% 保存数据
filename = ['data\Q', num2str(N), '.mat'];
save(filename, 'Q_ATC', 'Q_ATS', 'Q_LTC', 'Q_LTB', 'Q');


%关闭并行计算
% closematlabpool;
