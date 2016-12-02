function bus = set_PQ(Y,bus)
%计算每个节点的功率注入
global n m
G = real(Y);%电导
B = imag(Y);%电纳
U = bus(:,2);%电压
th = bus(:,3);%相角
%计算无功节点的无功注入
for i = m + 1:n - 1
    for j = 1:n
        bus(i,5) = bus(i,5) + U(i)*U(j)*(G(i,j)*sin(th(i) - th(j)) - B(i,j)*cos(th(i) - th(j)));
    end
end
%计算平衡节点的有功无功注入
for j = 1:n
    bus(n,4) = bus(n,4) + U(n)*U(j)*(G(n,j)*cos(th(n) - th(j)) + B(n,j)*sin(th(n) - th(j)));
    bus(n,5) = bus(n,5) + U(n)*U(j)*(G(n,j)*sin(th(n) - th(j)) - B(n,j)*cos(th(n) - th(j)));
end