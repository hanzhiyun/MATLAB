function B_o = B_origin(x, y, z, p)
% 原模型的空间(x, y, z)求磁感应强度的向量B_o(Bx, By, Bz)
% N 代表原模型的匝数
% p 代表故障位置，第p匝开始发生故障

format long
I_n = 17.616;        % 线圈原模型正常匝（normal）通电流大小
I_s = 456.9;           % 线圈 故障匝（short circuit）通电流大小
D = 0.606;   % 线圈的直径
R = D / 2;    % 线圈的半径
h = 0.00357;  % 线圈导线宽度
u = 1e-7;     % u0/4pi

% x = 0.2;
% y = 0;
% z = 0.1;
N = 148;  %线圈总匝数
n = 20;    %线圈故障匝数
% n = 0;
B_x = 0;
B_y = 0;
B_z = 0;
I = ones(1, N)* I_n;
I(p:p+n - 1) = ones(1, n)* I_s;

for k = 0:N-1
    f_x = @(th)u*I(k+1)*R*(z - k*h)*cos(th) ./ (sqrt((x - R*cos(th)).^2 + (y - R*sin(th)).^2 + (z - k*h).^2)).^3;
    f_y = @(th)u*I(k+1)*R*(z - k*h)*sin(th) ./ (sqrt((x - R*cos(th)).^2 + (y - R*sin(th)).^2 + (z - k*h).^2)).^3;
    f_z = @(th)u*I(k+1)*R*(R - x*cos(th) - y*sin(th)) ./ (sqrt((x - R*cos(th)).^2 + (y - R*sin(th)).^2 + (z - k*h).^2)).^3;
    
    B_x = B_x + quad(f_x, 0, 2*pi, 1e-8, 0);
    B_y = B_y + quad(f_y, 0, 2*pi, 1e-8, 0);
    B_z = B_z + quad(f_z, 0, 2*pi, 1e-8, 0);
end
B_o = [B_x, B_y, B_z];
B_o = norm(B_o);