clc;clear;
format long
%画出函数图像，对该函数有个大概的印象  
% t=-10:0.01:10;  
% y=sin(t).^2.*exp(-0.1*t)-0.5*abs(t);  
% plot(t,y)  
% hold on  
% plot([-10 10],[0 0],'k');  
%从图像我们可以看出大概在x=[-2-1 0 1 2]附近的某个值时，y为零。下面我们就用fzero来具体求出零点。  
f=@(t)sin(t).^2.*exp(-0.1*t)-0.5*abs(t)  
%第一种方法使用arrayfun  
x=[-2 -1 0 1 2];  
tol = 1e-5;
z = fzero(f, x(1), tol)
% arrayfun(@(x)fzero(f,x,tol),x)   
%第二种方法，分别带入  
% [x1 y]=fzero(f,-2)  
% [x2,y]=fzero(f,-1)  
% [x3,y]=fzero(f,0)  
% [x4,y]=fzero(f,1)  
% [x5,y]=fzero(f,2)  
% arrayfun(@(x)fzero(f,x),x)  