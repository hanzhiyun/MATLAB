function [L,R,D] = tri_dec(Y)
%triangular_decomposition三角分解法
[r,c] = size(Y);
%disp(r);
for k = 1:r                %课本P-259公式
    l(k,k) = 1;
    for j = 1:k - 1
        sum = 0;
        for p = 1:j - 1
            sum = sum + l(k,p)*r(p,j);
        end
        l(k,j) = (Y(k,j) - sum)/r(j,j);
    end
    for i = 1:k
        sum = 0;
        for p = 1:i - 1
            sum = sum + l(i,p)*r(p,k);
        end
        r(i,k) = Y(i,k) - sum;
    end
    d(k,k) = r(k,k);
end
L = l;
R = r;
D = d;
% disp(L);
% disp(R);