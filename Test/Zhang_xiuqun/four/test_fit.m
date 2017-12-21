function  test_fit(data)
format short g
x = data(:, 1);
y = data(:, 2);
z = data(:, 3);

B = data(:, 4);


x_ = unique(x);
y_ = unique(y);
z_ = unique(z);

for i = 1:3
    for j = 1:3
        for k = 1:3
            [row] = find(x == x_(i) & y == y_(j) & z == z_(k));
            B_(i, j, k) = B(row);
        end
    end
end
xs = 80:105;
ys = -35:35;
zs = 0:35;
figure,h = slice(x_, y_, z_, B_, xs, ys, zs);
set(h,'FaceColor','interp',...
    'EdgeColor','none')
camproj perspective
box on
view(-70,70)
colormap hsv
colorbar

% for i = 1:3
%     [row] = find(x == x_(i) & y == y_(1) & z == z_(1));
%     B_x(i) = B(row);
% end
% for i = 1:3
%     [row] = find(x == x_(1) & y == y_(i) & z == z_(1));
%     B_y(i) = B(row);
% end
% for i = 1:3
%     [row] = find(x == x_(1) & y == y_(1) & z == z_(i));
%     B_z(i) = B(row);
% end


% figure(1)
% hold on;
% plot(x_, B_x);
% plot(y_, B_y);
% plot(z_, B_z);
% 
% legend('x', 'y', 'z');


%二次
% X(:, 2) = x;
% X(:, 3) = x.^2;
% X(:, 4) = y;
% X(:, 5) = y.^2;
% X(:, 6) = z;
% X(:, 7) = z.^2;
% X(:, 1) = 1;
% Y = B;

%三次
% X(:, 2) = x;
% X(:, 3) = x.^2;
% X(:, 4) = x.^3;
% X(:, 5) = y;
% X(:, 6) = y.^2;
% X(:, 7) = y.^3;
% X(:, 8) = z;
% X(:, 9) = z.^2;
% X(:, 10) = z.^3;
% X(:, 1) = 1;
% Y = B;
% 
% b = regress(Y, X);


