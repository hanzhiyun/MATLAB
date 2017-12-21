%牛顿迭代法

%进行迭代运算
function Plot_Newton2()
for a = -2:0.01:2
    for b = -2:0.01:2
        X = a + b*1i;
        x0 = 0;
        while abs(X - x0) > 0.0001         %收敛判断
            x0 = X - f(X)/h(X);              %牛顿迭代格式        
            X = x0;
        end
        judge = min(min(abs(X - 1),abs(X - ((3^(1/2)*1i)/2 - 1/2))),abs(X - (- (3^(1/2)*1i)/2 - 1/2)));
        switch (judge)
            case abs(X - 1) 
            rectangle('Position',[a,b,0.01,0.01],'FaceColor','r','edgecolor','r')
            case abs(X - ((3^(1/2)*1i)/2 - 1/2)) 
            rectangle('Position',[a,b,0.01,0.01],'FaceColor','b','edgecolor','b')
            case abs(X - (- (3^(1/2)*1i)/2 - 1/2)) 
            rectangle('Position',[a,b,0.01,0.01],'FaceColor','g','edgecolor','g')
        end
%         fprintf('\n%s%.4f\t%s%d','X=',X) %输出结果
    end
end


%函数的表达式
function y = f(x)
y = x^3 - 1;  %函数f(x)的表达式

function z = h(x)
z = 3*x^2;%函数h(x）的表达式
