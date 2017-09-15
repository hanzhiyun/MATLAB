function B_r3 = B_ring3(x, y, z, N, p)
% ������ģ�͵Ŀռ�Ÿ�Ӧǿ����ȡ
% N ����ԭģ�͵�����
% p �������»�λ����Ը߶���ռ������ֵ����Ը߶Ȱٷֱ� rho = p/N��


% x = 0.2;
% y = 0;
% z = 0.1;
% N = 100;
% p = 33;

format long
m = 3;         % ��ģ�ͻ���
n = N / 5;    % n �����ģ��ÿһ��������
I = 1.5;        % ��Ȧԭģ��ͨ������С
i = I*N / (m*n); % ��ģ����Ȧͨ�������С
D = 0.124;   % ��Ȧ��ֱ��
% D = 0.248;
R = D / 2;    % ��Ȧ�İ뾶
h = 0.0006;  % ��Ȧ���߿��
u = 1e-7;     % u0/4pi

B_x = 0;
B_y = 0;
B_z = 0;

k = [N/2 - p, N/2, N/2 + p];

for j = 1:3
    f_x = @(th)u*n*i*R*(z - k(j)*h)*cos(th) ./ (sqrt((x - R*cos(th)).^2 + (y - R*sin(th)).^2 + (z - k(j)*h).^2)).^3;
    f_y = @(th)u*n*i*R*(z - k(j)*h)*sin(th) ./ (sqrt((x - R*cos(th)).^2 + (y - R*sin(th)).^2 + (z - k(j)*h).^2)).^3;
    f_z = @(th)u*n*i*R*(R - x*cos(th) - y*sin(th)) ./ (sqrt((x - R*cos(th)).^2 + (y - R*sin(th)).^2 + (z - k(j)*h).^2)).^3;
    
    B_x = B_x + quad(f_x, 0, 2*pi, 1e-8, 0);
    B_y = B_y + quad(f_y, 0, 2*pi, 1e-8, 0);
    B_z = B_z + quad(f_z, 0, 2*pi, 1e-8, 0);
end

B_r3 = [B_x, B_y, B_z];
B_r3 = norm(B_r3);
