function value = Is_observable(A, C)
% test
A = [0 1 0; 0 0 1; -18 -27 -10];
C = [1 1 0];
n = min(size(A));
N = [];
for i = 0:n - 1
     N = [N; C*A^i];
end
value = det(N);
if 0 == value
    disp('This state space is unobservable.')
else 
    disp('This state space is observable.')
end