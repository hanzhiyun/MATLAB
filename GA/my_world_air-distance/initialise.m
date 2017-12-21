function [pop] = initialise(popsize, stringlength)
% chromosome random number бн x f(x) 1/f(x)
pop0 = rand(popsize, stringlength);
x = fun_x(pop0);
y = fun(x);
pop = [pop0 x y 100./y];