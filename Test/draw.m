% draw some wave for patent
clc;clear;
t = 0:8;
y = [0, 2, 5, 10, 7, 5, 4, 3, 2.5];
p = polyfit(t, y, 3);
x = 0:0.1:8;
y1 = polyval(p, x);
plot(t, y, 'o');
hold on;
plot(x, y1);
hold off;