function [Xm,alfm] = FourierAlgorithm(x,m,N)
%傅里叶算法 
%xm(t) = sqrt(2)*Xm*sin(wm*t + alfm)
%wm = m*w1
%w1 = 50Hz
%N为采样次数，m次谐波
%x是原始数据
Xms = 0;
Xmc = 0;

for k = 0:N - 1 
    Xms = Xms + (2/N)*x(N - k)*sin((N - k - 1)*(2*pi/N)*m);
    Xmc = Xmc + (2/N)*x(N - k)*cos((N - k - 1)*(2*pi/N)*m);
end
disp(['X',num2str(m),'s = ',num2str(Xms)]);
disp(['X',num2str(m),'c = ',num2str(Xmc)]);
Xm = sqrt((Xms^2 + Xmc^2)/2);
alfm = atan(Xmc/Xms);