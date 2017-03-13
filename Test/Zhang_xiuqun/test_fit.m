function b = test_fit(data)
format short g
% filename = '数据.xlsx';
% data = xlsread(filename);
x = data(:, 1);
y = data(:, 2);
z = data(:, 3);
l = data(:, 4);
B = data(:, 5);

x_ = unique(x);
y_ = unique(y);
z_ = unique(z);
l_ = unique(l);
for i = 1:3
    row = find(x == x_(i) & y == y_(1) & z == z_(1) & l == l_(10));
    B_x(i) = B(row);
end
for i = 1:3
    row = find(x == x_(1) & y == y_(i) & z == z_(1) & l == l_(10));
    B_y(i) = B(row);
end
for i = 1:3
    row = find(x == x_(1) & y == y_(1) & z == z_(i) & l == l_(1));
    B_z(i) = B(row);
end
for i = 1:size(l_)
    row = find(x == x_(1) & y == y_(1) & z == z_(2) & l == l_(i));
    B_l(i) = B(row);
end

% figure(1)
% hold on;
% plot(x_, B_x);
% plot(y_, B_y);
% plot(z_, B_z);
% plot(l_, B_l);
% legend('x', 'y', 'z', 'l');

%二次
X = zeros(2727, 9);
X(:, 1) = 1;
X(:, 2) = x;
X(:, 3) = x.^2;
X(:, 4) = y;
X(:, 5) = y.^2;
X(:, 6) = z;
X(:, 7) = z.^2;
X(:, 8) = l;
X(:, 9) = l.^2;
Y = B;

%三次
% X = zeros(2727, 9);
% X(:, 1) = 1;
% X(:, 2) = x;
% X(:, 3) = x.^2;
% X(:, 4) = x.^3;
% X(:, 5) = y;
% X(:, 6) = y.^2;
% X(:, 7) = y.^3;
% X(:, 8) = z;
% X(:, 9) = z.^2;
% X(:, 10) = z.^3;
% X(:, 11) = l;
% X(:, 12) = l.^2;
% X(:, 13) = l.^3;
% X(:, 14) = l.^4;
% X(:, 15) = l.^5;
% Y = B;

b = regress(Y, X);


