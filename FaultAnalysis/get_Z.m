function Z = get_Z(L,D,k)
%�������ܣ��õ��ڵ��迹����ĵ�k��Ԫ��
[r,c] = size(L);
I = zeros(r,1);
I(k) = 1;
W = L\I;
X = D\W;
U = L'\X;
Z = U;