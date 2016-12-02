%Compares execution times of loops and vectors
%
%by Selim Aksoy, 7/3/2004

%Create a vector of random values
x = rand(1,10000);

%Find the maximum value using a loop
tic;            %reset the time counter
m = 0;
for ii = 1:length(x),
    if ( x(ii) > m ),
        m = x(ii);
    end
end
t1 = toc;       %elapsed time since last call to tic

%Find the maximum using the built-in function
tic;            %reset the time counter
m = max(x);
t2 = toc;       %elapsed time since last call to tic

%Display timing results
fprintf( 'Timing for loop is %f\n', t1 );
fprintf( 'Timing for built-in function is %f\n', t2 );



% %Compares execution times of loops and vectors
% %
% %by Selim Aksoy, 7/3/2004
% 
% %Use a loop
% tic;            %reset the time counter
% clear y;
% for x = 1:10000,
%     y(x) = 3 * x^2 + 4 * x + 5;
% end
% t1 = toc;       %elapsed time since last call to tic
% 
% %Use a loop again but also initialize the result vector
% tic;            %reset the time counter
% clear y;
% y = zeros(1,10000);
% for x = 1:10000,
%     y(x) = 3 * x^2 + 4 * x + 5;
% end
% t2 = toc;       %elapsed time since last call to tic
% 
% %Use vector operations
% tic;            %reset the time counter
% clear y;
% x = 1:10000;
% y = 3 * x.^2 + 4 * x + 5;
% t3 = toc;       %elapsed time since last call to tic
% 
% %Display timing results
% fprintf( 'Timing for uninizialed vector is %f\n', t1 );
% fprintf( 'Timing for inizialed vector is %f\n', t2 );
% fprintf( 'Timing for vectorization is %f\n', t3 );
