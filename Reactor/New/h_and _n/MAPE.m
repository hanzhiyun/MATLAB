function M = MAPE(At, Ft)
% 平均绝对误差百分比的计算，是在一个预测方法的预测精度的测量统计
n = length(At);
n1 = length(Ft);
if n ~= n1
    disp('Error! The length of Ft is not equal the length of At');
end
err = abs(At - Ft);
Mt = abs(err./At);
M = 100*sum(Mt)/n;