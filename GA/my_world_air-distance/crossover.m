function [child1, child2] = crossover(parent1, parent2, pc, stringlength)
% We generate a random number and compare it with pc.  If it is less than
% pc, crossover is performed.  The crossing point cpointis selected.
if(rand<pc)
    cpoint = round(rand*(stringlength-2))+1;
    child1 = [parent1(:,1:cpoint) parent2(:,cpoint+1:stringlength)];
    child2 = [parent2(:,1:cpoint) parent1(:,cpoint+1:stringlength)];
    child1(:, stringlength+1:stringlength+14) = fun_x(child1);
    child2(:, stringlength+1:stringlength+14) = fun_x(child2);
    child1(:, stringlength+15) = fun(child1(:, stringlength+1:stringlength+14));
    child2(:, stringlength+15) = fun(child2(:, stringlength+1:stringlength+14));
    child1(:, stringlength+16) = 100./child1(:, stringlength+15);
    child2(:, stringlength+16) = 100./child2(:, stringlength+15);
else
    child1=parent1;
    child2=parent2;
end