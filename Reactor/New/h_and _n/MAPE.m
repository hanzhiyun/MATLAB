function M = MAPE(err, At)
% ƽ���������ٷֱȵļ��㣬����һ��Ԥ�ⷽ����Ԥ�⾫�ȵĲ���ͳ��
n = length(err);
n1 = length(At);
if n ~= n1
    disp('Error! The length of err is not equal the length of At');
end
Mt = abs(err./At);
M = 100*sum(Mt)/n;