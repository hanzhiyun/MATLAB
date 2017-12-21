function table2
% scipt for table2
% 获取各个简化模型标准误差的值
source = 'experiment_data.xlsx';
result = 'result.xlsx';
ATC = xlsread(source, 1, 'B1:F21');
LTB = xlsread(source, 2, 'B1:F20');
All = [ATC; LTB];
Origin = All(:, 1);
Simplify = All(:, 2:5);

M = zeros(4, 1);
for i = 1:4
    M(i) = MAPE(Origin, Simplify(:, i));
end
disp(M)
