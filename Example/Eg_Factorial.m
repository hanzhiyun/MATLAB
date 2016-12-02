%Factorial(n!)求n的阶乘
n = input( 'Please enter n: ' );
if ( ( n < 0 ) || ( fix(n) ~= n ) ),%fix的功能是取整（全舍），此处用来判断n是否为整数
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