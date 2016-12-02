clc;clear;
i = deg2rad(97.418);%倾斜角 以下单位角度均转换为弧度
OMEGA = deg2rad(318.063);%升交点赤经 
e = 0.0002;%偏心率
omega = deg2rad(36.122);%近地点幅角
a = 6866e3;
b = 6866e3;
R = 6371393;%半径

A = [cos(omega)*cos(OMEGA) - sin(omega)*cos(OMEGA)*cos(i), sin(omega)*sin(OMEGA) - sin(omega)*cos(OMEGA)*cos(i), sin(omega)*sin(i)];
B = [-sin(omega)*cos(OMEGA) - cos(omega)*sin(OMEGA)*cos(i), -sin(omega)*sin(OMEGA) + cos(omega)*cos(OMEGA)*cos(i), cos(omega)*sin(i)];

% N = 100;
% E = [0:2*pi/N:2*pi]';
% 
% Rs = a*(cos(E) - e)*A + b*sin(E)*B;
% 
% mesh(Rs);

% %给定球心和直径，画出1个球。
% syms f th;
% r=6371393;%半径
% Re = [r*sin(th)*cos(f), r*sin(th)*sin(f), r*cos(th)];
% 
% ezsurf(Re(1), Re(2), Re(3));
syms E 
Rs = a*(cos(E) - e)*A + b*sin(E)*B;
fplot3(Rs(1), Rs(2), Rs(3), 'r');
view([180, 90, 90]);
hold on;
axis auto;

% N = 100;
% th = 0:2*pi/N:2*pi;
% f = 0:2*pi/N:2*pi;
% r=6371393;%半径
% Re = [r.*sin(th).*cos(f), r.*sin(th).*sin(f), r.*cos(th)];
% mesh(Re);
% mesh(Re(1), Re(2), Re(3));