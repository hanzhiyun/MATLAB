function delta_n = delta_n(N, p)
% 求最优简化模型过程中的误差

%开启并行计算
% pool = startmatlabpool(4); 

N = 100;
p = 34;
% n = 20;

Delta_x = [];
Delta_z = [];

parfor n = 1:3*N/5-2
    delta_x = [];
    delta_z = [];
    for x = 0.064:0.002:0.2
        B_o = B_origin(x, 0, 0, N);
        B_r3 = B_ring3_n(x, 0, 0, N, p, 2*n);
        delta_x = [delta_x, abs(norm(B_o) - norm(B_r3))/norm(B_o)];
    end
%     figure
%     x = 0.064:0.002:0.2;
%     plot(x,delta_x);
    Delta_x = [Delta_x, sum(delta_x)];
        
    for z = 0:0.002:0.2
        B_o = B_origin(0, 0, z, N);
        B_r3 = B_ring3_n(0 , 0, z, N, p, 2*n);
        delta_z = [delta_z, abs(norm(B_o) - norm(B_r3))/norm(B_o)];
    end
%     figure
%     z = 0:0.002:0.2;
%     plot(z,delta_z);
    Delta_z = [Delta_z, sum(delta_z)];
end

% figure; 
% p = 1:N/2;
% plot(p, Delta_x, p, Delta_z);
% hold on;
% Delta_s = Delta_x + Delta_z;
% plot(p, Delta_s);
% legend('Delta_x', 'Delta_z', 'Delta_s');
% 
% [~, px] = min(Delta_x)
% [~, pz] = min(Delta_z)
% [~, ps] = min(Delta_s)

figure;
n = 1:3*N/5-2;
n = 2*n;
plot(n, Delta_x, n, Delta_z);
hold on;
Delta_s = Delta_x + Delta_z;
plot(n, Delta_s);
legend('Delta_x', 'Delta_z', 'Delta_s');

[~, nx] = min(Delta_x)
[~, nz] = min(Delta_z)
[~, ns] = min(Delta_s)

%关闭并行计算
% closematlabpool;  
