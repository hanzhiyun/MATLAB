function M = MASE(err, At)
% 平均绝对比例误差的计算
n = length(err);
n1 = length(At);
if n ~= n1
    disp('Error! The length of err is not equal the length of At');
end
err_ave = sum(abs(err)) / n;
Yt = At(2:n1);
Yt1 = At(1:n1-1);
Y_ave = sum(abs(Yt - Yt1)) / (n1 - 1);
M = err_ave / Y_ave;
