function logistic_test
% Âß¼­Ë¹µÙÓ³Éä

% N = 100;
% k = 3.99;
% x = zeros(N,1);
% x(1) = 0.1;
% for i = 1:N-1
%     x(i + 1) = k*x(i)*(1-x(i));
% end
% % plot(x)
% scatter([1:N], x);


clear;
clf;
u=2.6:0.001:4.0;
x=0.9;
for i=1:300
x=u.*(x-x.^2);
end
for j=1:200
x=u.*(x-x.^2);
plot(u,x,'k.','markersize',2)
hold on;
end
grid on