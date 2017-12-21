function M = NRMSD(At, Ft)
% ��׼���ٷֱȵļ���
n = length(At);
n1 = length(Ft);
if n ~= n1
    disp('Error! The length of Ft is not equal the length of At');
end

err = At - Ft;
sse = err./At;
SSE = sse * sse';

Mt = SSE / n;
M = sqrt(Mt);