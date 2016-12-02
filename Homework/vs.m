function y = vs(x)
y = 5e7*x.*(x > 0 & x < 1e-7) + 5.*(x >= 1e-7 & x <= 9e-7) + (50 - 5e7*x).*(x >= 9e-7 & x < 1e-6);
