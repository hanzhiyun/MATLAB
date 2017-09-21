function [] = main()
% 循环计算不同高径比的31组数据
%开启并行计算
pool = startmatlabpool(7); 

parfor i = 1:31
    n = 90 + 10*i;
    delta_np(n);
end

%关闭并行计算
closematlabpool; 