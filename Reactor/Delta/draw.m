function draw()
% 画出p,n与N的关系

for i = 1:31
    N = 90 + 10*i;
    ns = 3*N/5;
    filename = ['Delta', num2str(N), '.mat'];
    load(filename);
    [D_x1, I_x1] = min(Delta_x1);
    [d_x1, index_x1] = min(D_x1);
    p = I_x1(index_x1);
    n2 = 2*index_x1;
    rho_x1(i) = p / N;
    eta_x1(i) = n2 / ns;
    
    [D_x2, I_x2] = min(Delta_x2);
    [d_x2, index_x2] = min(D_x2);
    p = I_x2(index_x2);
    n2 = 2*index_x2;
    rho_x2(i) = p / N;
    eta_x2(i) = n2 / ns;
    
    [D_z, I_z] = min(Delta_z);
    [d_z, index_z] = min(D_z);
    p = I_z(index_z);
    n2 = 2*index_z;
    rho_z(i) = p / N;
    eta_z(i) = n2 / ns;
        
end
N = 90 + 10*(1:31);


figure(1)
plot(N, rho_x1, N, rho_x2, N, rho_z);
legend('rho_x_1', 'rho_x_2', 'rho_z');
set(gca,'YLim',[0 1]);  %X轴的数据显示范围
set(gca, 'YTicklabel', [0:10:100]);
xlabel('原模型的匝数N')
ylabel('相对高度百分比%');

figure(2)
plot(N, eta_x1, N, eta_x2, N, eta_z);
legend('eta_x_1', 'eta_x_2', 'eta_z');
set(gca,'YLim',[0 1]);  %X轴的数据显示范围
set(gca, 'YTicklabel', [0:10:100]);
xlabel('原模型的匝数N');
ylabel('相对匝数百分比%');


% plot(N, rho_x1, N, eta_x1);
% 
% plot(N, rho_x2, N, eta_x2);
% 
% plot(N, rho_z, N, eta_z);

% legend('rho_x_1', 'eta_x_1', 'rho_x_2', 'eta_x_2', 'rho_z', 'eta_z');


% hold on;
% plot(eta_x1);