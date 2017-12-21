function B_r3 = B_ring3_n(x, y, z, N, p, n)
% 三环简化模型的空间磁感应强度求取
% N 代表原模型的匝数
% p 代表上下环位置相对高度所占的匝数值（相对高度百分比 rho = p/N）


% x = 0.2;
% y = 0;
% z = 0.1;
% N = 100;
% p = 33;

format long
m = 3;         % 简化模型环数
% n = N / 5;    % n 代表简化模型每一环的匝数
ns = m*N/5;
nt = (ns - n)/2;
nj = [nt, n, nt];
I = 1.5;        % 线圈原模型通电流大小
i = I*N / ns; % 简化模型线圈通入电流大小
D = 0.124;   % 线圈的直径
% D = 0.248;
R = D / 2;    % 线圈的半径
h = 0.0006;  % 线圈导线宽度
u = 1e-7;     % u0/4pi

B_x = 0;
B_y = 0;
B_z = 0;

k = [N/2 - p, N/2, N/2 + p];

for j = 1:3
    f_x = @(th)u*nj(j)*i*R*(z - k(j)*h)*cos(th) ./ (sqrt((x - R*cos(th)).^2 + (y - R*sin(th)).^2 + (z - k(j)*h).^2)).^3;
    f_y = @(th)u*nj(j)*i*R*(z - k(j)*h)*sin(th) ./ (sqrt((x - R*cos(th)).^2 + (y - R*sin(th)).^2 + (z - k(j)*h).^2)).^3;
    f_z = @(th)u*nj(j)*i*R*(R - x*cos(th) - y*sin(th)) ./ (sqrt((x - R*cos(th)).^2 + (y - R*sin(th)).^2 + (z - k(j)*h).^2)).^3;
    
    B_x = B_x + quad(f_x, 0, 2*pi, 1e-8, 0);
    B_y = B_y + quad(f_y, 0, 2*pi, 1e-8, 0);
    B_z = B_z + quad(f_z, 0, 2*pi, 1e-8, 0);
end

B_r3 = [B_x, B_y, B_z];
% norm(B_r3)
