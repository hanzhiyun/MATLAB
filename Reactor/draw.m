function [] = draw()
% ������άͼ��
load('Delta300.mat');
% [p, n] = size(Delta_x);

figure
% n = 2*n;
surf(Delta_s,'EdgeColor','None');%����z��3Dͼ 
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