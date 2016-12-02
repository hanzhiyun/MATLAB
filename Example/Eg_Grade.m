%成绩的分段表示
%输入成绩
grade = input('please input your grade score:');
if ( grade > 95 ),
    disp( 'Grade is A' );
elseif ( grade > 86 ),
    disp( 'Grade is B' );
elseif ( grade > 76 ),
    disp( 'Grade is C' );
elseif ( grade > 66 ),
    disp( 'Grade is D' );
else
    disp( 'Grade is F' );
end
