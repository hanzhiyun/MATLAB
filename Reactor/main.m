function [] = main()

%开启并行计算
pool = startmatlabpool(4); 

parfor i = 1:32
    n = 90 + 10*i;
    delta_np(n);
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