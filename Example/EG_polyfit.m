x = [-10 -8 -6 -4 -2 0 2 4 6 8 10];
y = [-980 -620 -70 80 100 90 0 -80 -90 10 220];
m = 2:5;
x2 = -10:0.5:10;
MSE = zeros(length(m));
for i = 1:length(m)
    fprintf('m = %i \n',m(i));
    A = zeros(m(i) + 1);
    A = polyfit(x,y,m(i));
    Yc = polyval(A,x);
    MSE(i) = (1/length(x) * sum((y - Yc).^2));
    fprintf('           x            y             yc \n');
    fprintf('------------------------------------------\n');
    for j = 1:length(x)
        fprintf('%5.0f      %5.0f             %8.2f   \n',...
            x(j),y(j),Yc(j));
    end
    fprintf('\n\n');
    subplot(2,2,1);
    plot(x2,polyval(A,x2),x,y,'o');
    xlabel('x');
    ylabel('y');
    grid;
    axis([-10 10 -1500 500]);
    title(sprintf('Degree %d polynomial fit',m(i)));
end
fprintf('  m                       MSE  \n');
fprintf('------------------------------\n');
for i = 1:length(m)
    fprintf('  %g        %10.2f    \n',m(i),MSE(i));
end