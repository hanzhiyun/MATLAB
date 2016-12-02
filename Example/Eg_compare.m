A = [3 2 -1;-1 3 2;1 0 0];
C = [10;5;-1];
tic;
x1 = inv(A)*C;
t1 = toc
tic;
x2 = A\C;
t2 = toc