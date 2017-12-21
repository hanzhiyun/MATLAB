clc;clear;
h = 1:3;
l = 1:100;
for i = 1:3
    switch i
        case 1
            B(i,:) = 3.*l + 5;
        case 2
            B(i,:) = 4.*l + 6;
        case 3
            B(i,:) = 5.*l + 7;
    end
end
x = zeros(300,3);
x(:, 1) = 1;
x(:, 2) = sort(repmat(h', 100, 1));
x(:, 3) = repmat(l', 3, 1);
y = reshape(B', 300, 1);

b = regress(y, x);


y_ = b(1) + b(2)*2 + b(3)* 55