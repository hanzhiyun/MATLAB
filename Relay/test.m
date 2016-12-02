clc;clear;
syms x y
R1 = 7.58e-6;
XL1 = 2.64e-4;
XC1 = 227.97e6;
z1 = R1 + 1i*XL1 + 1/XC1;
R0 = 1.54e-4;
XL0 = 8.3e-4;
XC0 = 342.59e6;
z0 = R0 + 1i*XL0 + 1/XC0;
K = (z0 - z1)/(3*z1);
L = 363e3;
ZL = z1*L;
line([0 real(ZL)],[0 imag(ZL)]);
hold on;
Zset = 0.85*ZL;
disp(['50%����·�迹��',num2str(ZL/2)]);
disp(['�����迹��',num2str(Zset)]);
disp(['��ǣ�',num2str(rad2deg(phase(Zset)))]);
r = abs(Zset/2);
disp(['�迹Բ�뾶��',num2str(r)]);
x0 = real(Zset/2);
y0 = imag(Zset/2);
disp(['�迹ԲԲ�ģ�','(',num2str(x0),',',num2str(y0),')']);
plot(x0,y0,'r.');
ezplot((x - x0)^2 + (y - y0)^2 == r^2,[-100,100,-10,100]);
axis equal;
plot([real(ZL/2) 45],[imag(ZL/2) imag(ZL/2)]);
%1.37657
%41.3655
Zg = 41.37 - 1.37;
disp(['��ͼ��֪�����迹���Ϊ��',num2str(Zg)]);

%����·ĩ�˷���A��ӵض�·ʱ��Zm
% U1 = 503.16;
% thU1 = 7.316;
% I1 = 1.266;
% thI1 = -66;
% I0 = 5.8;


%����·��50%��
% A��ӵض�·
%û�мӹ����迹ʱ
U1 = 340;
thU1 = -7.77;
I1 = 2.56;
thI1 = -79.5;
I0 = 6.55;


% �����迹Ϊ30ohmʱ
% U1 = 364.43;
% thU1 = -16.09;
% I1 = 2.498;
% thI1 = -69.337;
% I0 = 6.411;

% �����迹Ϊ40ohmʱ
% U1 = 373.60;
% thU1 = 0.634;
% I1 = 2.486;
% thI1 = -66;
% I0 = 6.38;

% �����迹Ϊ80ohmʱ
% U1 = 428.19;
% thU1 = -25.58;
% I1 = 2.52;
% thI1 = -53;
% I0 = 6.2;


UmA = U1*exp(1i*deg2rad(thU1));
ImA = I1*exp(1i*deg2rad(thI1)) + K*3*I0;
ZmA = UmA/ImA;
disp(['�����迹��ZmA = ',num2str(ZmA)]);
plot(real(ZmA),imag(ZmA),'y.');


% BC����·

%�����迹Ϊ75ohm
% Ub = 663.98;
% thUb = -168.54;
% Uc = 525.38;
% thUc = 157.93;
% Ib = 4.18;
% thIb = -138.08;
% Ic = 3.07;
% thIc = -21.43;

%�����迹Ϊ80ohm
Ub = 669.65;
thUb = -168.5;
Uc = 520.41;
thUc = 157.56;
Ib = 4.20;
thIb = -137.5;
Ic = 3.04;
thIc = -20.79;

UB = Ub*exp(1i*deg2rad(thUb));
UC = Uc*exp(1i*deg2rad(thUc));
IB = Ib*exp(1i*deg2rad(thIb));
IC = Ic*exp(1i*deg2rad(thIc));

UmBC = UB - UC;
ImBC = IB - IC;
ZmBC = UmBC/ImBC;
disp(['�����迹��ZmBC = ',num2str(ZmBC)]);
plot(real(ZmBC),imag(ZmBC),'g.');