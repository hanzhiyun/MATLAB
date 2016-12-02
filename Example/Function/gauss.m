function X = gauss(A,C)
[ac,al] = size(A);
[cc,cl] = size(C);
X = zeros(1,ac);
if ac ~= al || al ~= cl
    msg('输入参数有误！');
    return;
end
a = [A,C];
l = zeros(4,4);
for k = 1:ac
    for i = k + 1:ac
        l(i,k) = a(i,k)/a(k,k);
        for j = k + 1:ac + 1
            a(i,j) = a(i,j) - l(i,k)*a(k,j);
        end
    end
end

for k = 1:ac
    
    