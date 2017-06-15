function [] = draw()
% 画出三维图像
load('Delta300.mat');
% [p, n] = size(Delta_x);

figure
% n = 2*n;
surf(Delta_s,'EdgeColor','None');%绘制z的3D图 
% shading interp;  
% mesh(Delta_z)
[D, I] = min(Delta_s)
[d, i] = min(D)
p = I(i)
n = 2*i
% figure
% plot(D)
% hold on 
% plot(I)