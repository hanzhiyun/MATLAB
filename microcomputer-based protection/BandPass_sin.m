function y = BandPass_sin(x)
%正弦型带通滤波器
h = [0 -1/2 -sqrt(3)/2 -1 -sqrt(3)/2 -1/2 0 1/2 sqrt(3)/2 1 sqrt(3)/2 1/2];
y = 0;
for n = 1:12
    y = y + x(13 - n)*h(n);
end