%ţ�ٵ�����

%������
function Newton()
a = input('please input the a initial value:');
b = input('please input the b initial value:');
X = a + b*1i;
% x = X;%������ֵ
% f(x) = input('please enter the initial function:f(x) = ');
% h(x) = input('please enter the derived function:h(x) = ');
m = 0;%������������
while m <= 100%��������
x0 = X - f(X)/h(X);%ţ�ٵ�����ʽ
if abs(x0 - X) > 0.01;%�����ж�
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
fprintf('\n%s%.4f\t%s%d','X=',X,'m=',m) %������
end

%�Ӻ���
function y = f(x)
y = x^4 - 1;  %����f(x)�ı��ʽ
end
function z = h(x)
z = 4*x^3;%����h(x���ı��ʽ
end