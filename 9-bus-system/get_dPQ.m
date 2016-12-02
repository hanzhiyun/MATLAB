function [dP,dQ] = get_dPQ(Y,bus)
%通过迭代运算求得dP和dQ
global n m
G = real(Y);%电导
B = imag(Y);%电纳
U = bus(:,2);%电压
th = bus(:,3);%相角
P0 = bus(1:n - 1,4);%对P和Ｑ赋初始值
Q0 = bus(1:m,5);
P = zeros(n - 1,1);
Q = zeros(m,1);
% dP = zeros(n - 1,1);
% dQ = zeros(m,1);
for i = 1:n - 1
    for j = 1:n
        P(i) = P(i) + U(i)*U(j)*(G(i,j)*cos(th(i) - th(j)) + B(i,j)*sin(th(i) - th(j)));
        if i <= m
            Q(i) = Q(i) + U(i)*U(j)*(G(i,j)*sin(th(i) - th(j)) - B(i,j)*cos(th(i) - th(j)));
        end
    end
%     dP(i) = P0(i) - P(i);
%     if i <= m
%         dQ(i) = Q0(i) - Q(i);
%     end
end
dP = P0 - P;
dQ = Q0 - Q;