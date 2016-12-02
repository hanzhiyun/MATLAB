function homework3
%build by hanzhiyun 
%2015.5.17
%分段函数表示方法
% x = 0:0.01:1;
% y = 50*x.*(x > 0 & x < 0.1) + 5.*(x >= 0.1 & x <= 0.9) + (50 - 50*x).*(x > 0.9 & x < 1);
% plot(x,y)
%此处vs在已定义
C1 = 1e-6;
C2 = 1e-9;
R = 1e5;
L = 1e-5;
vc1 = [0 0];
vc2 = [0 0];
iL = [0 0];
%三个方程
f1 = @(t,Vc1,Vc2,Il) Il/C1 + (1/(C1*R))*(vs(t) - Vc1 + Vc2);
f2 = @(t,Vc1,Vc2,Il) -(1/(C2*R))*(vs(t) - Vc1 + Vc2);
f3 = @(t,Vc1,Vc2,Il) 1/L*(vs(t) - Vc1);

iter = 1000;
h = 1e-8;
resf1(1,[1 2]) = vc1;
resf2(1,[1 2]) = vc2;
resf3(1,[1 2]) = iL;

tt = 0;
for i = 1:iter
    kf11 = feval(f1,tt,vc1(2),vc2(2),iL(2));
    kf21 = feval(f2,tt,vc1(2),vc2(2),iL(2));
    kf31 = feval(f3,tt,vc1(2),vc2(2),iL(2));
    
    kf12 = feval(f1,tt + 0.5*h,vc1(2) + 0.5*h*kf11,vc2(2) + 0.5*h*kf21,iL(2) + 0.5*h*kf31);
    kf22 = feval(f2,tt + 0.5*h,vc1(2) + 0.5*h*kf11,vc2(2) + 0.5*h*kf21,iL(2) + 0.5*h*kf31);
    kf32 = feval(f3,tt + 0.5*h,vc1(2) + 0.5*h*kf11,vc2(2) + 0.5*h*kf21,iL(2) + 0.5*h*kf31);
    
    kf13 = feval(f1,tt + 0.5*h,vc1(2) + 0.5*h*kf12,vc2(2) + 0.5*h*kf22,iL(2) + 0.5*h*kf32);
    kf23 = feval(f2,tt + 0.5*h,vc1(2) + 0.5*h*kf12,vc2(2) + 0.5*h*kf22,iL(2) + 0.5*h*kf32);
    kf33 = feval(f3,tt + 0.5*h,vc1(2) + 0.5*h*kf12,vc2(2) + 0.5*h*kf22,iL(2) + 0.5*h*kf32);

    kf14 = feval(f1,tt + h,vc1(2) + h*kf13,vc2(2) + h*kf23,iL(2) + h*kf33);
    kf24 = feval(f2,tt + h,vc1(2) + h*kf13,vc2(2) + h*kf23,iL(2) + h*kf33);
    kf34 = feval(f3,tt + h,vc1(2) + h*kf13,vc2(2) + h*kf23,iL(2) + h*kf33);
    
    kf1 = vc1(2) + h*(kf11 + 2*kf12 + 2*kf13 + kf14)/6;
    kf2 = vc2(2) + h*(kf21 + 2*kf22 + 2*kf23 + kf24)/6;
    kf3 = iL(2) + h*(kf31 + 2*kf32 + 2*kf33 + kf34)/6;
    
    vc1(2) = kf1;
    vc2(2) = kf2;
    iL(2) = kf3;
    tt = vc1(1) + i*h;
    
    resf1(i + 1,[1 2]) = [tt kf1];
    resf2(i + 1,[1 2]) = [tt kf2];
    resf3(i + 1,[1 2]) = [tt kf3];
end

subplot(2,2,1);
plot(resf1(:,1),vs(resf1(:,1)));
title('Vs的波形');
xlabel('t/s');
ylabel('U/V');

subplot(2,2,2);
plot(resf1(:,1),resf1(:,2));
title('Vc1的波形');
xlabel('t/s');
ylabel('U/V');

subplot(2,2,3);
plot(resf2(:,1),resf2(:,2));
title('Vc2的波形');
xlabel('t/s');
ylabel('U/V');

subplot(2,2,4);
plot(resf3(:,1),resf3(:,2));
title('IL的波形');
xlabel('t/s');
ylabel('I/A');
    