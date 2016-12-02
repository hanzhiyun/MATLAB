% Building By Hanzhiyun 
% 本脚本用来重复调用直流激磁的测试电路，用来得到多次测量结果以能够得到最终的磁滞回线的图形
clc;clear;
open Measure_BH_curve3;
% 查看'Measure_BH_curve3/AC Current Source'的所有参数
% get_param('Measure_BH_curve3/AC Current Source','ObjectParameters')
% 设置电流的最大值
Imax = 2;
% 设置激磁电流变化的步长
Istep = 0.1;   
%初始化I和U的矩阵
n = 2*Imax/Istep + 1;
I = zeros(n, 1);
U = zeros(n, 1);
% 设置仿真运行的时间
stop_time = 0.1;
k = 0;
% for i = 0:Istep:Imax
%     k = k + 1;
%     set_param('Measure_BH_curve3/AC Current Source', 'Amplitude', 'i');
%     % 设置Simulink从当前工作空间运行
%     options = simset('SrcWorkspace','current');
%     % 使用sim()函数对模型进行仿真
%     % 第一参数是模型名称
%     % 第二个参数是向量，指定仿真开始和结束时间
%     % 如果设置为[]，则使用在Simulink中设置的始末时间
%     % 第三个参数设置Simulink仿真选项
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
title('基本磁化曲线');
xlabel('直流激磁电流/I');
ylabel('电压/U');