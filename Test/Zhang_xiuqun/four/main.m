function main
% global data;
format long
% if isempty(data)
%     filename = '0µã.xlsx';
%     data = xlsread(filename);
% end
filename0 = 'ATC-1m.xlsx';
filename3 = 'LTC-3m.xlsx';
data0 = xlsread(filename0);
data3 = xlsread(filename3);
% [l, B] = input_lB(data);
% fun = @f_B;
% x0 = [0, 0, 0];
% x = fsolve(fun, x0)


test_fit(data0);
test_fit(data3);
% x = data(:,1:3);
% B = data(:,4);
% F = f_B(x) - B'
% [~,idx] = find(abs(F) < 1)
% emin = F(idx)