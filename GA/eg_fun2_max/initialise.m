function [pop]=initialise(popsize, stringlength)
pop=round(rand(popsize, stringlength+3));

pop(:, stringlength+1) = (2.^(8-1:-1:0)*pop(:,1:8)'*0.0235294 -3)'; % x
pop(:, stringlength+2) = (2.^(8-1:-1:0)*pop(:,9:16)'*0.0235294 -3)';% y
pop(:, stringlength+3) = fun2(pop(:, stringlength+1), pop(:, stringlength+2));