function [] = delta_np(N)
% 求最优简化模型过程中的误差

%开启并行计算
% pool = startmatlabpool(4);

% N = 20;
% p = 34;
% n = 20;
h = 0.0006;  % 线圈导线宽度

Delta_x1 = [];
Delta_x2 = [];
Delta_z = [];
Delta_s = [];

for p = 1:N/2
    Delta_xt1 = [];
    Delta_xt2 = [];
    Delta_zt = [];
    Delta_st = [];
    
    for n = 1:3*N/5-2
        delta_x1 = [];
        delta_x2 = [];
        delta_z = [];
        
        for x = 0.064:0.008:0.2
            % 电抗器底端轴向比较
            B_o = B_origin(x, 0, 0, N);
            B_r3 = B_ring3_n(x, 0, 0, N, p, 2*n);
            delta_x1 = [delta_x1, abs(norm(B_o) - norm(B_r3))/norm(B_o)];
            % 电抗器中间轴向比较
            B_o = B_origin(x, 0, h*N/2, N);
            B_r3 = B_ring3_n(x, 0, h*N/2, N, p, 2*n);
            delta_x2 = [delta_x2, abs(norm(B_o) - norm(B_r3))/norm(B_o)];
        end
        %     figure
        %     x = 0.064:0.002:0.2;
        %     plot(x,delta_x);
        
        for z = h*N/2:0.02:h*N*2
            B_o = B_origin(0, 0, z, N);
            B_r3 = B_ring3_n(0 , 0, z, N, p, 2*n);
            delta_z = [delta_z, abs(norm(B_o) - norm(B_r3))/norm(B_o)];
        end
        %     figure
        %     z = 0:0.002:0.2;
        %     plot(z,delta_z);
        
        Delta_xt1 = [Delta_xt1, sum(delta_x1)/length(delta_x1)];
        Delta_xt2 = [Delta_xt2, sum(delta_x2)/length(delta_x2)];
        Delta_zt = [Delta_zt, sum(delta_z)/length(delta_z)];
        
        Delta_st = [Delta_st, (sum(delta_x1) + sum(delta_x2) + sum(delta_z))/3];
    end
    Delta_x1 = [Delta_x1; Delta_xt1];
    Delta_x2 = [Delta_x2; Delta_xt2];
    Delta_z = [Delta_z; Delta_zt];
    Delta_s = [Delta_s; Delta_st];
end

filename = ['Delta', num2str(N), '.mat'];
save(filename, 'Delta_x1', 'Delta_x2', 'Delta_z', 'Delta_s');

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

% figure;
% n = 1:3*N/5-2;
% n = 2*n;
% plot(n, Delta_x, n, Delta_z);
% hold on;
% Delta_s = Delta_x + Delta_z;
% plot(n, Delta_s);
% legend('Delta_x', 'Delta_z', 'Delta_s');

% [~, nx] = min(Delta_x)
% [~, nz] = min(Delta_z)
% [~, ns] = min(Delta_s)

%关闭并行计算
% closematlabpool;
