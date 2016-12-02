function fy=vdp(t,x) 
r=x(1)^2+x(2)^2+x(3)^2; 
G=3.986005e14; 
A=-G/r^(3/2); 
fy=[x(4) 
    x(5)    
    x(6)     
    A*x(1)     
    A*x(2)     
    A*x(3)]; 
