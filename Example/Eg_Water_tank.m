%水箱剩余容积计算并且有对输入的检测
r = input('Enter the radius of the tank base (in meters):');
if ( r <= 0 ),    
    error( 'Radius must be positive' );
end
h = input('Enter the height of the tank (in meters):');
if ( h <= 0 ),    
    error( 'Height must be positive' );
end
w = input('Enter the amount of water (in m3):');
if ( w <= 0 ),    
    error( 'Amount of water must be positive' );
end
capacity = pi * r^2 * h;space = capacity - w;
if ( space > 0 ),
    disp( [ 'There is ' num2str(space) ' m3 extra space' ] );
else
    disp( 'Tank is full' );
end
