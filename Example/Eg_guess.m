%��һ�������
num = round( (10-1) * rand + 1 );   %round��������
guess = input( 'Your guess?\n' );
tries = 1;
while ( guess ~= num ),
    guess = input( 'Your guess?\n' );
    tries = tries + 1;
end
fprintf( 'You guessed correctly in %d tries\n', tries );

% num = round( (10-1) * rand + 1 );
% guess = input( 'Your guess?' );
% tries = 1;
% while ( ( guess ~= num ) & ( tries < 3 ) ),
%     guess = input( 'Your guess?' );
%     tries = tries + 1;
% end
% if ( guess == num ),
%     disp( 'Congratulations!' );
% else
%     disp( 'You could not guess correctly' );
% end
