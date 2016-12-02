function homework1
%build by hanzhiyun 
%2015.5.15
%1
%initial vaule
n = 100;
Emax = 100;
%get random n x n matrix A
A = -Emax + (Emax -(-Emax)).*rand(n,n);
A = round(A);
disp(A);

%2
%creat a 1 x n column vector C
C = randi([-Emax,Emax],n,1);
disp(C);

%3
%compare the two ways
tic;
X1 = inv(A)*C;
t1 = toc;
tic;
X2 = A\C;
t2 = toc;
disp(['t1 = ',num2str(t1)]);
disp(['t2 = ',num2str(t2)]);
fprintf('\n得出的结论：左除的速度要更快一些\n\n\n');

%4
t11 = 0;
t21 = 0;
for i = 1:10
    tic;
    X1 = inv(A)*C;
    t11 = toc + t11;
    tic;
    X2 = A\C;
    t21 = toc + t21;
end
t1 = t11/10;
t2 = t21/10;
disp(['t1 = ',num2str(t1)]);
disp(['t2 = ',num2str(t2)]);
fprintf('\n得出的结论：左除的速度要更快一些\n');

n = [3 10 30 300 1000];
t = zeros(5,2);
%t矩阵的第一列是用inv的时间，第二列是用左除计算的时间
[t(1,1),t(1,2)] = get_t(3);
[t(2,1),t(2,2)] = get_t(10);
[t(3,1),t(3,2)] = get_t(30);
[t(4,1),t(4,2)] = get_t(300);
[t(5,1),t(5,2)] = get_t(1000);
disp(t);


loglog(n,t(:,1),'-s');
hold on;
loglog(n,t(:,2),'-s');
grid on;
xlabel('n轴线');
ylabel('time轴线');
title ('time 与 n 的关系');

function [t1,t2] = get_t(n)
Emax = 100;
A = -Emax + (Emax -(-Emax)).*rand(n,n);
A = round(A);
C = randi([-Emax,Emax],n,1);
t11 = 0;
t21 = 0;
for i = 1:10
    tic;
    X1 = inv(A)*C;
    t11 = toc + t11;
    tic;
    X2 = A\C;
    t21 = toc + t21;
end
t1 = t11/10;
t2 = t21/10;
