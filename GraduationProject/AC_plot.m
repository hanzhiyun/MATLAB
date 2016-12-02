%build by hanzhiyun
figure(1);
plot(V1, V2);
grid on;
axis([-40,40,-500,500]);
title('交流激磁下测得的磁滞回线');
xlabel('原边取样电压U1/V');
ylabel('副边测量电压U2/V');