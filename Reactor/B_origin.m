function B_o = B_origin(x, y, z, N)
% ԭģ�͵Ŀռ�(x, y, z)��Ÿ�Ӧǿ�ȵ�����B_o(Bx, By, Bz)
% N ����ԭģ�͵�����

format long
I = 1.5;        % ��Ȧԭģ��ͨ������С
D = 0.124;   % ��Ȧ��ֱ��
R = D / 2;    % ��Ȧ�İ뾶
h = 0.0006;  % ��Ȧ���߿��
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