function [] = draw()
% ������άͼ��
load('Delta100.mat');
% [p, n] = size(Delta_x);

% n = 2*n;
% surf(Delta_s,'EdgeColor','None');%����z��3Dͼ 
% shading interp;  
figure
mesh(Delta_z)
[D, I] = min(Delta_z)
[d, i] = min(D)

figure
plot(D)
hold on 
plot(I)