%示例函数文件
%求n的阶乘
function p = factorial(n)
%FACTORIAL Factorial function.
%   FACTORIAL(N) is the product of all the integers from 1 to N,  
%   i.e. prod(1:N). Since double precision numbers only have about
%   15 digits, the answer is only accurate for N <= 21. For larger N,
%   the answer will have the right magnitude, and is accurate for 
%   the first 15 digits.
%
%   See also PROD.

%   Copyright 1984-2001 The MathWorks, Inc. 
%   $Revision: 1.5 $

if (length(n)~=1) || (fix(n) ~= n) || (n < 0)
  error('N must be a positive integer');
end

p = prod(1:n);
end
