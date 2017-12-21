function delta = delta(N)
% �����ż�ģ�͹����е����

%�������м���
pool = startmatlabpool(4); 

% N = 100;
% p = 34;
D = 0.124;   % ��Ȧ��ֱ��
R = D / 2;    % ��Ȧ�İ뾶
h = 0.0006;  % ��Ȧ���߿��
interval = D / 50; % ����������ȡ��50 �ļ���С

Q_ATC = [];
Q_ATS = [];
Q_LTC = [];
Q_LTB = [];

parfor p = 1:N/2
    err_ATC = [];
    err_ATS = [];
    err_LTC = [];
    err_LTB = [];
    
    % ATC����
    for z = 0:-interval:-D
        B_o = B_origin(0, 0, z, N);
        B_r3 = B_ring3(0, 0, z, N, p);
        err_ATC = [err_ATC, abs(norm(B_o) - norm(B_r3))]
    end
    
    % ATS����
    for z = 0:-interval:-D
        B_o = B_origin(0, R, z, N);
        B_r3 = B_ring3(0, R, z, N, p);
        err_ATS = [err_ATS, abs(norm(B_o) - norm(B_r3))];
    end
    
    % LTC����
    for y = R:interval:R+D
        B_o = B_origin(0, y, N*h/2, N);
        B_r3 = B_ring3(0, y, N*h/2, N, p);
        err_LTC = [err_LTC, abs(norm(B_o) - norm(B_r3))];
    end
    
    % LTB����
    for y = R:interval:R+D
        B_o = B_origin(0, y, 0, N);
        B_r3 = B_ring3(0, y, 0, N, p);
        err_LTB = [err_LTB, abs(norm(B_o) - norm(B_r3))];
    end
    
    Q_ATC = [Q_ATC, least_squares(err_ATC)];
    Q_ATS = [Q_ATS, least_squares(err_ATS)];
    Q_LTC = [Q_LTC, least_squares(err_LTC)];
    Q_LTB = [Q_LTB, least_squares(err_LTB)];
    
end
% Q = Q_ATC + Q_ATS + Q_LTC + Q_LTB;
% ��������
filename = ['Q', num2str(N), '.mat'];
save(filename, 'Q_ATC', 'Q_ATS', 'Q_LTC', 'Q_LTB');

figure;
p = 1:N/2;
plot(p, Q_ATC, p, Q_ATS, p, Q_LTC, p, Q_LTB);
% hold on;
% plot(p, Q);
% legend('Q_ATC', 'Q_ATS', 'Q_LTC', 'Q_LTB', 'Q');

[v_ATC, p_ATC] = min(Q_ATC)
[v_ATS, p_ATS] = min(Q_ATS)
[v_LTC, p_LTC] = min(Q_LTC)
[v_LTB, p_LTB] = min(Q_LTB)
% [v, p] = min(Q)
%�رղ��м���
closematlabpool;  
