function value = Is_controllable(A, B)
% test
% A = [0 0 -18; 1 0 -27; 0 1 -10];
% B = [1; 1; 0];
n = min(size(A));
M = [];
for i = 0:n - 1
     M = [M, A^i * B];
end
disp('M = ');
disp(M);
value = det(M);
if 0 == value
    disp('This state space is not controllable.')
else 
    disp('This state space is controllable.')
end