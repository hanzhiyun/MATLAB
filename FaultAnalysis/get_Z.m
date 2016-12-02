function Z = get_Z(L,D,k)
%函数功能：得到节点阻抗矩阵的第k列元素
[r,c] = size(L);
I = zeros(r,1);
I(k) = 1;
W = L\I;
X = D\W;
U = L'\X;
Z = U;