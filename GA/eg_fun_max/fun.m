function [out1]=fun(x)
% [xs,ys]=size(x);
% out1=zeros(xs,ys);
% for i = 1:xs
%     for j = 1:ys
%         out1(i,j)= (sin(10*x(i,j))^2) / (1 + x(i,j));
%     end
% end
out1= (sin(10*x).^2) ./ (1 + x);