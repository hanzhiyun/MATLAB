% Building By Hanzhiyun 
% ���ű������ظ�����ֱ�����ŵĲ��Ե�·�������õ���β���������ܹ��õ����յĴ��ͻ��ߵ�ͼ��
clc;clear;
open Measure_BH_curve3;
% �鿴'Measure_BH_curve3/AC Current Source'�����в���
% get_param('Measure_BH_curve3/AC Current Source','ObjectParameters')
% ���õ��������ֵ
Imax = 2;
% ���ü��ŵ����仯�Ĳ���
Istep = 0.1;   
%��ʼ��I��U�ľ���
n = 2*Imax/Istep + 1;
I = zeros(n, 1);
U = zeros(n, 1);
% ���÷������е�ʱ��
stop_time = 0.1;
k = 0;
% for i = 0:Istep:Imax
%     k = k + 1;
%     set_param('Measure_BH_curve3/AC Current Source', 'Amplitude', 'i');
%     % ����Simulink�ӵ�ǰ�����ռ�����
%     options = simset('SrcWorkspace','current');
%     % ʹ��sim()������ģ�ͽ��з���
%     % ��һ������ģ������
%     % �ڶ���������������ָ�����濪ʼ�ͽ���ʱ��
%     % �������Ϊ[]����ʹ����Simulink�����õ�ʼĩʱ��
%     % ��������������Simulink����ѡ��
%     sim('Measure_BH_curve3', stop_time, options);
%     I(k) = i;
%     U(k) = max(simout);
% end
% for i = Imax: -Istep: -Imax
%     k = k + 1;
%     set_param('Measure_BH_curve3/AC Current Source', 'Amplitude', 'i');
%     options = simset('SrcWorkspace','current');
%     sim('Measure_BH_curve3', stop_time, options);
%     I(k) = i;
%     if sum(simout) > 0
%         U(k) = max(simout);
%     else
%         U(k) = min(simout);
%     end
% end
for i = -Imax: Istep: Imax
    k = k + 1;
    set_param('Measure_BH_curve3/AC Current Source', 'Amplitude', 'i');
    options = simset('SrcWorkspace','current');
    sim('Measure_BH_curve3', stop_time, options);
    I(k) = i;
    if sum(simout) > 0
        U(k) = max(simout);
    else
        U(k) = min(simout);
    end
end
plot(I, U);
title('�����Ż�����');
xlabel('ֱ�����ŵ���/I');
ylabel('��ѹ/U');