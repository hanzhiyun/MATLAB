function bus = set_PQ(Y,bus)
%����ÿ���ڵ�Ĺ���ע��
global n m
G = real(Y);%�絼
B = imag(Y);%����
U = bus(:,2);%��ѹ
th = bus(:,3);%���
%�����޹��ڵ���޹�ע��
for i = m + 1:n - 1
    for j = 1:n
        bus(i,5) = bus(i,5) + U(i)*U(j)*(G(i,j)*sin(th(i) - th(j)) - B(i,j)*cos(th(i) - th(j)));
    end
end
%����ƽ��ڵ���й��޹�ע��
for j = 1:n
    bus(n,4) = bus(n,4) + U(n)*U(j)*(G(n,j)*cos(th(n) - th(j)) + B(n,j)*sin(th(n) - th(j)));
    bus(n,5) = bus(n,5) + U(n)*U(j)*(G(n,j)*sin(th(n) - th(j)) - B(n,j)*cos(th(n) - th(j)));
end