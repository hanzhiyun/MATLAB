N = 80;             %采样点数为80   0.02/0.00025 = 80
t = 0.105;          %合闸时间    
n = t/0.00025;      %从合闸后开始进行傅里叶分解
Ia1 = VarName11(n:n + N);
m = 1;
w1 = 100*pi;        %工频 w = 2*pi*f
wm = m*w1;
[Xm,alfm] = FourierAlgorithm(Ia1,m,N);
disp(['Xm = ',num2str(Xm),'   alfm = ',num2str(rad2deg(alfm))]);
t = 0:0.0001:0.04;
xm = sqrt(2)*Xm*sin(wm*t + alfm);
plot(xm);
hold on;
