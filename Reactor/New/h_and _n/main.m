function [] = main()
% ѭ�����㲻ͬ�߾��ȵ�31������
%�������м���
pool = startmatlabpool(7); 

parfor i = 1:31
    n = 90 + 10*i;
    delta_np(n);
end

%�رղ��м���
closematlabpool; 