function delta = delta(N)
% 求最优简化模型过程中的误差

%开启并行计算
pool = startmatlabpool(4); 

% N = 100;
% p = 34;
D = 0.124;   % 线圈的直径
R = D / 2;    % 线圈的半径
h = 0.0006;  % 线圈导线宽度
interval = D / 50; % 各个方向上取点50 的间距大小

Q_ATC = [];
Q_ATS = [];
Q_LTC = [];
Q_LTB = [];

parfor p = 1:N/2
    err_ATC = [];
    err_ATS = [];
    err_LTC = [];
    err_LTB = [];
    
    % ATC方向
    for z = 0:-interval:-D
        B_o = B_origin(0, 0, z, N);
        B_r3 = B_ring3(0, 0, z, N, p);
        err_ATC = [err_ATC, abs(norm(B_o) - norm(B_r3))]
    end
    
    % ATS方向
    for z = 0:-interval:-D
        B_o = B_origin(0, R, z, N);
        B_r3 = B_ring3(0, R, z, N, p);
        err_ATS = [err_ATS, abs(norm(B_o) - norm(B_r3))];
    end
    
    % LTC方向
    for y = R:interval:R+D
        B_o = B_origin(0, y, N*h/2, N);
        B_r3 = B_ring3(0, y, N*h/2, N, p);
        err_LTC = [err_LTC, abs(norm(B_o) - norm(B_r3))];
    end
    
    % LTB方向
    for y = R:interval:R+D
        B_o = B_origin(0, y, 0, N);
        B_r3 = B_ring3(0, y, 0, N, p);
        err_LTB = [err_LTB, abs(norm(B_o) - norm(B_r3))];
    end
    
    Q_ATC = [Q_ATC, least_squares(err_ATC)];
    Q_ATS = [Q_ATS, least_squares(err_ATS)];
    Q_LTC = [Q_LTC, least_squares(err_LTC)];
    Q_LTB = [Q_LTB, least_squares(err_LTB)];
    
end
% Q = Q_ATC + Q_ATS + Q_LTC + Q_LTB;
% 保存数据
filename = ['Q', num2str(N), '.mat'];
save(filename, 'Q_ATC', 'Q_ATS', 'Q_LTC', 'Q_LTB');

figure;
p = 1:N/2;
plot(p, Q_ATC, p, Q_ATS, p, Q_LTC, p, Q_LTB);
% hold on;
% plot(p, Q);
% legend('Q_ATC', 'Q_ATS', 'Q_LTC', 'Q_LTB', 'Q');

[v_ATC, p_ATC] = min(Q_ATC)
[v_ATS, p_ATS] = min(Q_ATS)
[v_LTC, p_LTC] = min(Q_LTC)
[v_LTB, p_LTB] = min(Q_LTB)
% [v, p] = min(Q)
%关闭并行计算
closematlabpool;  
