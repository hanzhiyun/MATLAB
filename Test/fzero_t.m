clc;clear;
format long
%��������ͼ�񣬶Ըú����и���ŵ�ӡ��  
% t=-10:0.01:10;  
% y=sin(t).^2.*exp(-0.1*t)-0.5*abs(t);  
% plot(t,y)  
% hold on  
% plot([-10 10],[0 0],'k');  
%��ͼ�����ǿ��Կ��������x=[-2-1 0 1 2]������ĳ��ֵʱ��yΪ�㡣�������Ǿ���fzero�����������㡣  
f=@(t)sin(t).^2.*exp(-0.1*t)-0.5*abs(t)  
%��һ�ַ���ʹ��arrayfun  
x=[-2 -1 0 1 2];  
tol = 1e-5;
z = fzero(f, x(1), tol)
% arrayfun(@(x)fzero(f,x,tol),x)   
%�ڶ��ַ������ֱ����  
% [x1 y]=fzero(f,-2)  
% [x2,y]=fzero(f,-1)  
% [x3,y]=fzero(f,0)  
% [x4,y]=fzero(f,1)  
% [x5,y]=fzero(f,2)  
% arrayfun(@(x)fzero(f,x),x)  