clc;clear;

% homework 3-12

% A = [1 2 -1;0 1 0;0 -4 3];
% b = [0; 0; 1];
% c = [1 -1 1];
% n = min(size(A));
% N = [];
% for i = 0:n - 1
%      N = [N; c*A^i];
% end
% N
% r = rank(N);
% % disp(r);
% if r < n
%     Rn = [0 0 1];
%     Ro_inv = N(1:n - 1, :);
%     Ro_inv = [Ro_inv; Rn]
%     Ro = inv(Ro_inv)
%     Ao = Ro_inv * A * Ro
%     bo = Ro_inv * b
%     co = c * Ro
% end




%3-14(2)

A = [0     0     1     0     0     0
     0     0     0     1     0     0
     0     0     0     0     1     0
     0     0     0     0     0     1
     0     0     0     0     0     0
     0     0     0     0     0     0];
B = [0 0
    0 0 
    0 0
    0 0
    1 0
    0 1];
C =[0 0 0 1 1 0; 0 1 1 0 0 0];
N = [C; C * A; C * A * A];
Ro_ = N(1:3,:)
t = eye(3,6)
t(3, 4) = 1;
Ro_ = [Ro_;t]  
rank(Ro_)
Ro = inv(Ro_)
Ao = Ro_ * A * Ro
Bo = Ro_ * B
Co = C * Ro
