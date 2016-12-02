%牛顿迭代法

%进行迭代运算
function Plot_Newton()
for a = -1:0.01:(1 - 0.01)
    for b = -1:0.01:(1 - 0.01)
        X = a + b*1i;
        q = 0;                      %迭代次数计算
        while q <= 100              %迭代次数
            x0 = X - f(X)/h(X);     %牛顿迭代格式
            if abs(x0 - X) > 0.0001;  %收敛判断
                X = x0;
            else break
            end
            q = q + 1;
        end
        %         x0 = 0;
        %         while abs(X - x0) > 0.00001         %收敛判断
        %             x0 = X - f(X)/h(X);              %牛顿迭代格式
        %             X = x0;
        %         end
        judge = min(min(min(abs(X - 1),abs(X - (-1))),abs(X - 1i)),abs(X - (-1i)));
        switch (judge)
            case abs(X - 1)
                rectangle('Position',[a,b,0.01,0.01],'FaceColor','r','edgecolor','r')
            case abs(X - (-1))
                rectangle('Position',[a,b,0.01,0.01],'FaceColor','y','edgecolor','y')
            case abs(X - 1i)
                rectangle('Position',[a,b,0.01,0.01],'FaceColor','b','edgecolor','b')
            case abs(X - (-1i))
                rectangle('Position',[a,b,0.01,0.01],'FaceColor','g','edgecolor','g')
        end
        %         fprintf('\n%s%.4f\t%s%d','X=',X) %输出结果
    end
end


%函数的表达式
function y = f(x)
y = x^4 - 1;  %函数f(x)的表达式

function z = h(x)
z = 4*x^3;%函数h(x）的表达式
