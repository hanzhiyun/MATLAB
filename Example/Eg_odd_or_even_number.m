%judge the nuber is odd or even number 
value = input ('please input one number from 1 to 10:');
if ((value < 1)||(value >10))
    error('The number is outside!');
end
switch (value),
    case {1,3,5,7,9},
        %disp( 'Odd number' );
        disp( [num2str(value) ' is odd number.']);
    case {2,4,6,8,10},   
        %disp( 'Even number' );
        disp([num2str(value) ' is even number.']);
    otherwise,    
        disp( 'Out of range' );
end
