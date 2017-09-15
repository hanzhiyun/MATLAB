function M = MAPE(err, At)
% 平均绝对误差百分比的计算，是在一个预测方法的预测精度的测量统计
n = length(err);
n1 = length(At);
if n ~= n1
    disp('Error! The length of err is not equal the length of At');
end
Mt = abs(err./At);
M = 100*sum(Mt)/n;