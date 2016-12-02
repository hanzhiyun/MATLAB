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
disp(['50%处线路阻抗：',num2str(ZL/2)]);
disp(['整定阻抗：',num2str(Zset)]);
disp(['相角：',num2str(rad2deg(phase(Zset)))]);
r = abs(Zset/2);
disp(['阻抗圆半径：',num2str(r)]);
x0 = real(Zset/2);
y0 = imag(Zset/2);
disp(['阻抗圆圆心：','(',num2str(x0),',',num2str(y0),')']);
plot(x0,y0,'r.');
ezplot((x - x0)^2 + (y - y0)^2 == r^2,[-100,100,-10,100]);
axis equal;
plot([real(ZL/2) 45],[imag(ZL/2) imag(ZL/2)]);
%1.37657
%41.3655
Zg = 41.37 - 1.37;
disp(['由图可知过渡阻抗大概为：',num2str(Zg)]);

%在线路末端发生A相接地短路时的Zm
% U1 = 503.16;
% thU1 = 7.316;
% I1 = 1.266;
% thI1 = -66;
% I0 = 5.8;


%在线路的50%处
% A相接地短路
%没有加过渡阻抗时
U1 = 340;
thU1 = -7.77;
I1 = 2.56;
thI1 = -79.5;
I0 = 6.55;


% 过渡阻抗为30ohm时
% U1 = 364.43;
% thU1 = -16.09;
% I1 = 2.498;
% thI1 = -69.337;
% I0 = 6.411;

% 过渡阻抗为40ohm时
% U1 = 373.60;
% thU1 = 0.634;
% I1 = 2.486;
% thI1 = -66;
% I0 = 6.38;

% 过渡阻抗为80ohm时
% U1 = 428.19;
% thU1 = -25.58;
% I1 = 2.52;
% thI1 = -53;
% I0 = 6.2;


UmA = U1*exp(1i*deg2rad(thU1));
ImA = I1*exp(1i*deg2rad(thI1)) + K*3*I0;
ZmA = UmA/ImA;
disp(['测量阻抗：ZmA = ',num2str(ZmA)]);
plot(real(ZmA),imag(ZmA),'y.');


% BC相间短路

%过渡阻抗为75ohm
% Ub = 663.98;
% thUb = -168.54;
% Uc = 525.38;
% thUc = 157.93;
% Ib = 4.18;
% thIb = -138.08;
% Ic = 3.07;
% thIc = -21.43;

%过渡阻抗为80ohm
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
disp(['测量阻抗：ZmBC = ',num2str(ZmBC)]);
plot(real(ZmBC),imag(ZmBC),'g.');