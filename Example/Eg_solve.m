clc;clear;
syms x;
s = solve(x^4==4,x,'real',true);
m = length(s);
a = 0;
for i = 1:m
    if s(i) >= 0
       a = a + 1;
       y(a) = s(i); 
    end
end
fprintf('The eqns have %d positive real solutions.\n',a);
fprintf('The solutions are ');
disp(y);

