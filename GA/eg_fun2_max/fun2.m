function[out]=fun2(x, y)
% f(x,y) = .....; To search for the max of a two-variable function
% Answer: x = -0.6235 y = -0.8353 (max function value is around 1.6709 )
% domain for x and y are both [-3,3]


% [xs,ys]=size(xx);
% out=zeros(xs,ys);
% for i= 1:xs
%     for j = 1:ys
%         x = xx(i,j); y = yy(i,j);
%         out(i,j)= (1 -x)^2*exp( -1*x*x -(y+1)*(y+1)) -(x -x^3 -y^3)*exp(-x*x-y*y);
%     end
% end


out  = (1 - x).^2.*exp( -1.*x.*x - (y+1).*(y+1)) -(x -x.^3 -y.^3).*exp(-x.*x-y.*y);