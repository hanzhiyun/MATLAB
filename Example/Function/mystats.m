%主函数
function [avg, med] = mystats(u)
%MYSTATS Find mean and median with internal functions.
% Function MYSTATS calculates the average and median
% of a data set using subfunctions.

n = length(u);
avg = mean(u,n);
med = median(u,n);
%子函数功能：求矩阵的平均值
function a = mean(v,n)
% Subfunction to calculate average.
a = sum(v)/n;
%子函数功能：求矩阵的排序后的中间值
function m = median(v,n)
% Subfunction to calculate median.
w = sort(v);        %排序
if rem(n,2) == 1    %取余
   m = w((n+1)/2);
else
   m = (w(n/2)+w(n/2+1))/2;
end
