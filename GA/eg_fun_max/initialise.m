function [pop] = initialise(popsize, stringlength,b,a)
% chromosome 0 1 0 1 0 1 1 0 0 1 0 бн x f(x)
pop = round(rand(popsize, stringlength+2));

pop(:, stringlength+1) = (2.^(stringlength-1:-1:0) * pop(:,1:stringlength)'*(b-a)/(2^stringlength-1)+a)';
pop(:, stringlength+2) = fun(pop(:, stringlength+1));