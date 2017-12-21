function M = MAPE(At, Ft)
% ƽ���������ٷֱȵļ��㣬����һ��Ԥ�ⷽ����Ԥ�⾫�ȵĲ���ͳ��
n = length(At);
n1 = length(Ft);
if n ~= n1
    disp('Error! The length of Ft is not equal the length of At');
end
err = abs(At - Ft);
Mt = abs(err./At);
M = 100*sum(Mt)/n;