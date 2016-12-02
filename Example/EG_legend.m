%legend µÄÓÃ·¨
x = 0:0.01:4*pi;
y1 = sin(x);
y2 = sin(x + 2/3*pi);
y3 = sin(x + 4/3*pi);
plot(x,y1,x,y2,x,y3);
legend('y1 = sin(x)','y2 = sin(x + 2/3*pi)','y3 = sin(x + 4/3*pi)','location','northwest');
xlabel('t');
ylabel('U');