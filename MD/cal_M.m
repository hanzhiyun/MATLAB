function cal_M
% ����Э����
M = importdata('dipole.out');
% a = M(:, 1);
% b = M(:, 2);
% covariance = cov(a, b)
result = cov(M)