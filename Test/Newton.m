%牛顿迭代法

%主函数
function Newton()
a = input('please input the a initial value:');
b = input('please input the b initial value:');
X = a + b*1i;
% x = X;%迭代初值
% f(x) = input('please enter the initial function:f(x) = ');
% h(x) = input('please enter the derived function:h(x) = ');
m = 0;%迭代次数计算
while m <= 100%迭代次数
x0 = X - f(X)/h(X);%牛顿迭代格式
if abs(x0 - X) > 0.01;%收敛判断
X=x0;
else break
end
m=m+1;
end
% if abs(X - 1) <= 0.1
%         rectangle('Position',[a,b,0.01,0.01],'FaceColor','r')
%     elseif abs(X - (-1)) <= 0.1
%         rectangle('Position',[a,b,0.01,0.01],'FaceColor','y')
%     elseif abs(X - 1i) <= 0.1
%         rectangle('Position',[a,b,0.01,0.01],'FaceColor','b')
%     elseif abs(X - (-1i)) <= 0.1
%         rectangle('Position',[a,b,0.01,0.01],'FaceColor','g')
% end 
fprintf('\n%s%.4f\t%s%d','X=',X,'m=',m) %输出结果
end

%子函数
function y = f(x)
y = x^4 - 1;  %函数f(x)的表达式
end
function z = h(x)
z = 4*x^3;%函数h(x）的表达式
end