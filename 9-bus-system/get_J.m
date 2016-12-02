function J = get_J(Y,bus)
%�õ��ſ˱Ⱦ���
global n m 
G = real(Y);%�絼
B = imag(Y);%����
U = bus(:,2);%��ѹ
th = bus(:,3);%���

H = zeros(n-1,n-1);
N = zeros(n-1,m);
M = zeros(m,n-1);
L = zeros(m,m);         % ���ſ˱Ⱦ���ֿ飬����J = [H   N; K   L]������ʼ��

P = zeros(n-1,1);
Q = zeros(n-1,1);

for i = 1:n - 1
    for j = 1:n
        P(i) = P(i) + U(i)*U(j)*(G(i,j)*cos(th(i) - th(j)) + B(i,j)*sin(th(i) - th(j)));
        Q(i) = Q(i) + U(i)*U(j)*(G(i,j)*sin(th(i) - th(j)) - B(i,j)*cos(th(i) - th(j)));
    end
end

for i = 1:n - 1
    for j = 1:n - 1
        if i ~= j
            H(i,j) = U(i)*U(j)*(G(i,j)*sin(th(i) - th(j)) - B(i,j)*cos(th(i) - th(j)));
        else
            H(i,i) = -(U(i)^2)*B(i,i) - Q(i);
        end
        
        if j <= m
            if i ~= j
                N(i,j) = U(i)*U(j)*(G(i,j)*cos(th(i) - th(j)) + B(i,j)*sin(th(i) - th(j)));
            else
                N(i,i) = (U(i)^2)*G(i,i) + P(i);
            end
        end
        
        if i <= m
            if i ~= j
                M(i,j) = -U(i)*U(j)*(G(i,j)*cos(th(i) - th(j)) + B(i,j)*sin(th(i) - th(j)));
            else
                M(i,i) = -(U(i)^2)*G(i,i) + P(i);
            end
            
            if j <= m
                if i ~= j
                    L(i,j) = H(i,j);
                else
                    L(i,i) = -(U(i)^2)*B(i,i) + Q(i);
                end
            end
        end
    end
end

J = [H N;M L];