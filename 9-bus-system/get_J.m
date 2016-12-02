function J = get_J(Y,bus)
%得到雅克比矩阵
global n m 
G = real(Y);%电导
B = imag(Y);%电纳
U = bus(:,2);%电压
th = bus(:,3);%相角

H = zeros(n-1,n-1);
N = zeros(n-1,m);
M = zeros(m,n-1);
L = zeros(m,m);         % 将雅克比矩阵分块，即：J = [H   N; K   L]，并初始化

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