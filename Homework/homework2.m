function homework2
%build by hanzhiyun 
%2015.5.15
%��quad�����������

f1 = @(x)(sinh(x) - cos(x));
A = 0.0;
B = pi;
I = quad(f1,A,B);
fprintf('��quad����������ֽ����');
disp(['I = ',num2str(I)]);

%������ɭ����������
A = 0.0;
B = pi;
N = 100;
dx = (B - A)/N;
x = A:dx:B;
f2 = sinh(x) - cos(x);

sum_even = 0.0;
for i = 2:2:N
    sum_even = sum_even + f2(i);
end
sum_odd = 0.0;
for i = 3:2:N
    sum_odd = sum_odd + f2(i);
end
I = dx/3*(f2(1) + 4*sum_even + 2*sum_odd + f2(N+1));
fprintf('������ɭ���������ֽ����');
disp(['I = ',num2str(I)]);
