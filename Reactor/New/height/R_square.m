function R = R_square(At, Ft)
% ȷ��ϵ���ļ��㣬��ģ�Ͷ�������ϵ�Ч������
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