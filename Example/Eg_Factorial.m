%Factorial(n!)��n�Ľ׳�
n = input( 'Please enter n: ' );
if ( ( n < 0 ) || ( fix(n) ~= n ) ),%fix�Ĺ�����ȡ����ȫ�ᣩ���˴������ж�n�Ƿ�Ϊ����
    error( 'n must be a non-negative integer' );
end
if ( ( n == 0 ) || ( n == 1 ) ),
    f = 1;
else    f = 1; 
    for ii = 2:n,      
        f = f * ii;   
    end
end
fprintf('The result is %d\n', f);