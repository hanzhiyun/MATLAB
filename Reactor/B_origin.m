function B_o = B_origin(x, y, z, N)
% 原模型的空间(x, y, z)求磁感应强度的向量B_o(Bx, By, Bz)
% N 代表原模型的匝数

format long
I = 1.5;        % 线圈原模型通电流大小
D = 0.124;   % 线圈的直径
% D = 0.248;
R = D / 2;    % 线圈的半径
h = 0.0006;  % 线圈导线宽度
u = 1e-7;     % u0/4pi

% x = 0.2;
% y = 0;
% z = 0.1;
% N = 100;
% n = 0;
B_x = 0;
B_y = 0;
B_z = 0;

for k = 0:N-1
    f_x = @(th)u*I*R*(z - k*h)*cos(th) ./ (sqrt((x - R*cos(th)).^2 + (y - R*sin(th)).^2 + (z - k*h).^2)).^3;
    f_y = @(th)u*I*R*(z - k*h)*sin(th) ./ (sqrt((x - R*cos(th)).^2 + (y - R*sin(th)).^2 + (z - k*h).^2)).^3;
    f_z = @(th)u*I*R*(R - x*cos(th) - y*sin(th)) ./ (sqrt((x - R*cos(th)).^2 + (y - R*sin(th)).^2 + (z - k*h).^2)).^3;
    
    B_x = B_x + quad(f_x, 0, 2*pi, 1e-8, 0);
    B_y = B_y + quad(f_y, 0, 2*pi, 1e-8, 0);
    B_z = B_z + quad(f_z, 0, 2*pi, 1e-8, 0);
end
B_o = [B_x, B_y, B_z];