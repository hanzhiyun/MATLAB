function [] = main()
% 循环计算不同高径比的31组数据
%开启并行计算
pool = startmatlabpool(7); 

parfor i = 1:31
    n = 90 + 10*i;
    delta(n);
end
% delta_np(100);
% delta_np(200);
% delta_np(300);
% delta_n(100, 40);
% delta_n(200, 34);
% delta_n(200, 70);
% delta_n(300, 103);

%关闭并行计算
closematlabpool; 