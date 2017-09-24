function M = RMSE(At, Ft)
% 均方根误差（标准误差）的计算
n = length(At);
n1 = length(Ft);
if n ~= n1
    disp('Error! The length of Ft is not equal the length of At');
end

sse = At - Ft;
SSE = sse * sse';

Mt = SSE / n;
M = sqrt(Mt);