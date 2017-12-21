function [] = delta_np(N)
% �����ż�ģ�͹����е����

%�������м���
% pool = startmatlabpool(4);
% ѭ������
cnt_p = N/2;        % ��ģ�͸߶ȶ�Ӧ������ֵ��Χ 
cnt_n = 3*N/5-2;  % ��ģ���м价������������ֵ 

% �ĸ������ϵ�ƽ����ʧ����ֵ
Q_ATC = zeros(cnt_p, cnt_n);
Q_ATS = zeros(cnt_p, cnt_n);
Q_LTC = zeros(cnt_p, cnt_n);
Q_LTB = zeros(cnt_p, cnt_n);

% ����ĸ������ϵ�ԭģ�͵ĴŸ�Ӧǿ��
[Bo_ATC, Bo_ATS, Bo_LTC, Bo_LTB] = B_o_4direction(N);

for p = 1:cnt_p    
    for n = 1:cnt_n
        % ����ĸ������ϵļ�ģ�͵ĴŸ�Ӧǿ��
        [Br_ATC, Br_ATS, Br_LTC, Br_LTB] = B_r_4direction(N, p, n);
        
        err_ATC = abs(Bo_ATC - Br_ATC);
        err_ATS = abs(Bo_ATS - Br_ATS);
        err_LTC = abs(Bo_LTC - Br_LTC);
        err_LTB = abs(Bo_LTB - Br_LTB);
        
        Q_ATC(p, n) = least_squares(err_ATC);
        Q_ATS(p, n) = least_squares(err_ATS);
        Q_LTC(p, n) = least_squares(err_LTC);
        Q_LTB(p, n) = least_squares(err_LTB);
    end
end

% �����ƽ����ʧ������ƽ���������ٷֱ�
Q = Q_ATC + Q_ATS + Q_LTC + Q_LTB;

% ��������
filename = ['data\Q', num2str(N), '.mat'];
save(filename, 'Q_ATC', 'Q_ATS', 'Q_LTC', 'Q_LTB', 'Q');


%�رղ��м���
% closematlabpool;
