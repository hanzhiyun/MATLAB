clc;clear;
% x(1,:)=[37.8 66.7 18031 131.4 11.97 238.5 4.31 55.32 25.11 15.26]; 
% x(2,:)=[37.3 67.8 19834 148   12.03 263.3 4.82 55.28 23.86 16.04]; 
% x(3,:)=[37.1 68.2 21953 168.8 14.23 283   4.5  57.34 24.03 8.43];      
% x(4,:)=[37.7 68.4 24834 182   14.89 304.9 4.63 55    25.45 14.91]; 
% x(5,:)=[38.2 68.6 27442 200.4 15.78 311.6 4.37 55.2  25.48 14.89]; 
% x(6,:)=[38.1 65.9 29774 219.3 16.56 325.5 4.17 53.62 26.03 16.24]; 
% x(7,:)=[38.4 66.4 32334 234.2 16.65 336.6 4.38 48.35 30.27 17];    %列出7年10个因素数值
% m=7;n=9;  
% x0=[12.3 10.4 7.5 7.7 2.2 4.5 3.4];           %参考序列  
% for i=1:m     
%  for j=1:n 
%  avg(j)=avg(j)+X(i,j);    
%  end 
% end       %求和
%                                                  
% avg = avg/m;      %求均值
% 
% for j=1:m     
%  for i=1:n 
%   X(j,i)=X(j,i)/avg(i);                          
%  end 
% end       %均值化
% 
% sum0=0;
% for i=1:m
% sum0=sum0+x0(i);
% end
% avg0=sum0/m;
% for i=1:m
% x0(i)=x0(i)/avg0;
% end      %参考数列均值化
% 
% for i=1:m     
%  for j=1:n 
%   delta(i,j)=abs(X(i,j)-x0(i));           
%  end 
% end     %求序列差
%  
% max=delta(1,1); 
% for i=1:n     
%  for j=1:m 
%    if delta(i,j)>max             
%    max=delta(i,j); 
%   end
%  end
% end       %求极大值
% 
% min=delta(1,1);
% for i=1:n
%  for j=1:m
%   if delta(i,j)<min
%    min=delta(i,j);
%   end
%  end
% end      %求极小值
%                                                     
% for i=1:n
%  xgd(i)=0;                                         
%  for j=1:m 
% glxs(j,i)=(min+0.5*max)/(0.5*max+delta(j,i));             %求关联系数
%    xgd(i)=xgd(i)+glxs(j,i);          
%  end 
%  xgd(i)=xgd(i)/m;      %求关联度
% end 

format long
X = xlsread('data0915.xlsx', 'B2:L8');
[m, n] = size(X);

avg = sum(X) / m;
X = X / diag(avg);       %去量纲化

x_err = zeros(m, n - 1);
for i = 2:n
    x_err(:,i - 1) = abs(X(:, i) - X(:, 1));
end
x_max = max(max(x_err));
x_min = min(min(x_err));

X_end = (x_min + 0.5 * x_max) ./ (X + 0.5 * x_max);
X_avg = sum(X_end) / m;

X_rate = (prod(X(2:m, 2:n) / diag(X(1, 2:n)))) .^ (1/21) - 1; 