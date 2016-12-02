function y = BandPass_cos(x)
%ÓàÏÒĞÍ´øÍ¨ÂË²¨Æ÷
h = [1/2 sqrt(3)/2 1/2 0 -1/2 -sqrt(3)/2 -1 -sqrt(3)/2 -1/2 0 1/2 sqrt(3)/2];
y = 0;
for n = 1:12
    y = y + x(13 - n)*h(n);
end