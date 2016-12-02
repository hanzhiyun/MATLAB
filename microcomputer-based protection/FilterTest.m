function FilterTest
data = [0 9333 6935 8667 6935 9333 0 -9333 -6935 -8667 -6935 -9333 0 9333 6935 8667 6935 9333 0 -9333 -6935 -8667 -6935 -9333];
%l = length(data);
% plot(data);
% hold on;
N = 12;
% for n = 1:l - N + 1
%     x = data(n:n + 11);
%     y(n) = BandPass_cos(x);
%     z(n) = BandPass_sin(x);
% end
% plot(y);
% hold on;
% plot(z);
% hold on;
% disp(y);
% disp(z);
x = data;
m = 1;
w1 = 100*pi;
wm = m*w1;
[Xm,alfm] = FourierAlgorithm(x,m,N);
disp(['Xm = ',num2str(Xm),'   alfm = ',num2str(rad2deg(alfm))]);
t = 0:0.0001:0.04;
xm = sqrt(2)*Xm*sin(wm*t + alfm);
plot(xm);
hold on;
% disp(xm);