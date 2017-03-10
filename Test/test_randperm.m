function test_randperm(r, n)
%r是行数，n是指1~n
r = 10;n =13;
% A = 1:n;
% B = repmat(A, r, 1);

[~, idx] = sort(rand(r, n), 2);
% B = B(sub2ind([r, n], repmat((1:r)', 1, n), idx));


A=[4 4 6 4 6 1 1 2 2 ];
[c,i]=unique(A,'first')
j=sort(i);
d=A(j)