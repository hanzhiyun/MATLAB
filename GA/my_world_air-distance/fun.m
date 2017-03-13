function [out] = fun(x)
% get the distance of all

% test for x
% x = randperm(13);
% [~, index] = find(x == 9);
% x([1,index]) = x([index, 1]);
% x = [x 9];
% test for x matrix
% [~, x] = sort(rand(6, 13), 2);
% [row ,column] = find(x == 9);
% for i = 1:6
%     x(row(i),[1,column(i)]) = x(row(i),[column(i), 1]);
% end
% x = [x 9*ones(6,1)];

global data
if isempty(data)
    data = xlsread('distance_matrix.xlsx', 'B2:N14');
end
[r, c] = size(x);
out = zeros(r, 1);
for i = 1:r
    for j = 1:c-1
        out(i) = out(i) + data(x(i, j), x(i, j+1));
    end
end
