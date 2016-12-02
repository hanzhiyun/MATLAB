%非负测量值的平均值和标准差
% Initialize sums.
n = 0; sum_x = 0; sum_x2 = 0;

% Read in first value
x = input('Enter first value: ');

% While Loop to read input values.
while x >= 0

   % Accumulate sums.
   n      = n + 1;
   sum_x  = sum_x + x;
   sum_x2 = sum_x2 + x^2;

   % Read in next value
   x = input('Enter next value:  ');

end

% Calculate the mean and standard deviation
x_bar = sum_x / n;
std_dev = sqrt( (n * sum_x2 - sum_x^2) / (n * (n-1)) );

% Tell user.
fprintf('The mean of this data set is: %f\n', x_bar);
fprintf('The standard deviation is:    %f\n', std_dev);
fprintf('The number of data points is: %f\n', n);
