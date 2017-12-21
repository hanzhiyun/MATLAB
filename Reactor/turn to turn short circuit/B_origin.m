function B_o = B_origin(x, y, z, p)
% ԭģ�͵Ŀռ�(x, y, z)��Ÿ�Ӧǿ�ȵ�����B_o(Bx, By, Bz)
% N ����ԭģ�͵�����
% p �������λ�ã���p�ѿ�ʼ��������

format long
I_n = 17.616;        % ��Ȧԭģ�������ѣ�normal��ͨ������С
I_s = 456.9;           % ��Ȧ �����ѣ�short circuit��ͨ������С
D = 0.606;   % ��Ȧ��ֱ��
R = D / 2;    % ��Ȧ�İ뾶
h = 0.00357;  % ��Ȧ���߿��
u = 1e-7;     % u0/4pi

% x = 0.2;
% y = 0;
% z = 0.1;
N = 148;  %��Ȧ������
n = 20;    %��Ȧ��������
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