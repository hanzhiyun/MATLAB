function [] = delta(N)
% �����ż�ģ�͹����е����

%�������м���
% pool = startmatlabpool(3); 

% �ĸ������ϵ�ƽ����ʧ����ֵ
Q_ATC = [];
Q_ATS = [];
Q_LTC = [];
Q_LTB = [];

% �ĸ������ϵ�MAPE
% M_ATC = [];
% M_ATS = [];
% M_LTC = [];
% M_LTB = [];

% ����ĸ������ϵ�ԭģ�͵ĴŸ�Ӧǿ��
[Bo_ATC, Bo_ATS, Bo_LTC, Bo_LTB] = B_o_4direction(N);

for p = 1:N/2
    % ����ĸ������ϵļ�ģ�͵ĴŸ�Ӧǿ��
    [Br_ATC, Br_ATS, Br_LTC, Br_LTB] = B_r_4direction(N, p);
    
    err_ATC = abs(Bo_ATC - Br_ATC);
    err_ATS = abs(Bo_ATS - Br_ATS);
    err_LTC = abs(Bo_LTC - Br_LTC);
    err_LTB = abs(Bo_LTB - Br_LTB);
       
    Q_ATC = [Q_ATC, least_squares(err_ATC)];
    Q_ATS = [Q_ATS, least_squares(err_ATS)];
    Q_LTC = [Q_LTC, least_squares(err_LTC)];
    Q_LTB = [Q_LTB, least_squares(err_LTB)];
end

% �����ƽ����ʧ������ƽ���������ٷֱ�
Q = Q_ATC + Q_ATS + Q_LTC + Q_LTB;
% M = (M_ATC + M_ATS + M_LTC + M_LTB)./4;

% ��������
filename = ['data\Q', num2str(N), '.mat'];
save(filename, 'Q_ATC', 'Q_ATS', 'Q_LTC', 'Q_LTB', 'Q');
% save(filename, 'M_ATC', 'M_ATS', 'M_LTC', 'M_LTB', '-append');

% figure(1);
% p = 1:N/2;
% plot(p, Q_ATC, p, Q_ATS, p, Q_LTC, p, Q_LTB);
% hold on;
% plot(p, Q);
% legend('Q_{ATC}', 'Q_{ATS}', 'Q_{LTC}', 'Q_{LTB}', 'Q');

% figure(2);
% p = 1:N/2;
% plot(p, M_ATC, p, M_ATS, p, M_LTC, p, M_LTB);
% hold on;
% plot(p, M);
% legend('M_{ATC}', 'M_{ATS}', 'M_{LTC}', 'M_{LTB}', 'M');

% [q_ATC, p_ATC] = min(Q_ATC)
% [q_ATS, p_ATS] = min(Q_ATS)
% [q_LTC, p_LTC] = min(Q_LTC)
% [q_LTB, p_LTB] = min(Q_LTB)
% [q, p] = min(Q)

% min_M_ATC = M_ATC(p_ATC)
% min_M_ATS = M_ATS(p_ATS)
% min_M_LTC = M_LTC(p_LTC)
% min_M_LTB = M_LTB(p_LTB)
% min_M = M(p)

%�رղ��м���
% closematlabpool;  
