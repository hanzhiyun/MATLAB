function [child1, child2] = crossover(parent1, parent2, pc, stringlength, b, a)
% We generate a random number and compare it with pc.  If it is less than
% pc, crossover is performed.  The crossing point cpointis selected.
if(rand<pc)
    cpoint=round(rand*(stringlength-2))+1;
    child1=[parent1(:,1:cpoint) parent2(:,cpoint+1:stringlength)];
    child2=[parent2(:,1:cpoint) parent1(:,cpoint+1:stringlength)];
    child1(:, stringlength+1)=(2.^(stringlength-1:-1:0)*child1(:,1:stringlength)'*(b-a)/(2^stringlength-1)+a)';
    child2(:, stringlength+1)=(2.^(stringlength-1:-1:0)*child2(:,1:stringlength)'*(b-a)/(2^stringlength-1)+a)';
    child1(:, stringlength+2)=fun(child1(:, stringlength+1));
    child2(:, stringlength+2)=fun(child2(:, stringlength+1));
else
    child1=parent1;
    child2=parent2;
end