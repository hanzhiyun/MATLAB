%x=[3:0.01:5];
fun=@(x)sin(0.67+x)-sin(0.67)*exp(-x/tan(0.9));
x=fsolve(fun,2)
