function [] = draw()
% 画出三维图像
load('Delta100.mat');
% [p, n] = size(Delta_x);

% n = 2*n;
% surf(Delta_s,'EdgeColor','None');%绘制z的3D图 
% shading interp;  
figure
mesh(Delta_z)
[D, I] = min(Delta_z)
[d, i] = min(D)

figure
plot(D)
hold on 
plot(I)