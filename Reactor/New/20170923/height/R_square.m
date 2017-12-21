function R = R_square(At, Ft)
% 确定系数的计算，是模型对数据拟合的效果体现
n = length(At);
n1 = length(Ft);
if n ~= n1
    disp('Error! The length of Ft is not equal the length of At');
end

At_ave = sum(At)/n;
At_a = At_ave * ones(1, n);

sse = At - Ft;
SSE = sse * sse';

% ssr = Ft - At_a;
% SSR = ssr * ssr';

sst = At - At_a;
SST = sst * sst';

% R = SSR / SST;
R = 1 - SSE/SST;