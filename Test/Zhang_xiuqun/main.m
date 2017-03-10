function main
global b l B;
filename = 'Êý¾Ý - ATC.xlsx';
data = xlsread(filename);

% b = test_fit(data);
% [l, B] = input_lB(data);
% fun = @f_B;
% x0 = [0, 0, 0];
% x = fsolve(fun, x0)

% F = [];
% for i = 1:3:2727
%     x = data(i, 1:3);
%     l = data(i:i + 2, 4);
%     B = data(i:i + 2, 5);
%     F = [F, f_B(x)];
% end
% 
% [~,idx] = find(abs(F) < 1)
% emin = F(idx)