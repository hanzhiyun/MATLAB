function delta = delta(N)
% 求最优简化模型过程中的误差

%开启并行计算
pool = startmatlabpool(4); 

N = 100;
% p = 34;

Delta_x = [];
Delta_z = [];

parfor p = 1:N/2
    delta_x = [];
    delta_z = [];
    for x = 0.064:0.002:0.2
        B_o = B_origin(x, 0, 0, N);
        B_r3 = B_ring3(x, 0, 0, N, p);
        delta_x = [delta_x, abs(norm(B_o) - norm(B_r3))/norm(B_o)];
    end
    % figure
    % x = 0.064:0.002:0.2;
    % plot(x,delta_x);
    Delta_x = [Delta_x, sum(delta_x)];
        
    for z = 0:0.002:0.2
        B_o = B_origin(0, 0, z, N);
        B_r3 = B_ring3(0, 0, z, N, p);
        delta_z = [delta_z, abs(norm(B_o) - norm(B_r3))/norm(B_o)];
    end
    % figure
    % z = 0:0.002:0.2;
    % plot(z,delta_z);
    Delta_z = [Delta_z, sum(delta_z)];
end

figure;
p = 1:N/2;
plot(p, Delta_x, p, Delta_z);
legend('Delta_x', 'Delta_z');

%关闭并行计算
closematlabpool;  
