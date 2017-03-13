function x = fun_x(pop0)
% pop0 = rand(4, 13)
[popsize,strlen] = size(pop0);
[~, x] = sort(pop0, 2);

% [row ,column] = find(x == 9);
% for i = 1:popsize
%      x(row(i),[1,column(i)]) = x(row(i),[column(i), 1]);    
% end
% x = [x 9*ones(popsize, 1)];

x = x';
[index] = find(9 == x);
x(index) = [];
x = reshape(x, strlen-1, popsize);
x = x';
x = [9*ones(popsize, 1) x 9*ones(popsize, 1)];