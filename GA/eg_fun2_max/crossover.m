function[child1, child2]=crossover(parent1, parent2, pc,stringlength)
if(rand<pc)
    cpoint=round(rand*(stringlength-2))+1;
    child1=[parent1(:,1:cpoint) parent2(:,cpoint+1:stringlength)];
    child2=[parent2(:,1:cpoint) parent1(:,cpoint+1:stringlength)];
    child1(:, stringlength+1)=(2.^(8-1:-1:0)*child1(:,1:8)'*0.0235294 -3)'; % x
    child1(:, stringlength+2)=(2.^(8-1:-1:0)*child1(:,9:16)'*0.0235294 -3)'; % y
    child2(:, stringlength+1)=(2.^(8-1:-1:0)*child2(:,1:8)'*0.0235294 -3)'; % x
    child2(:, stringlength+2)=(2.^(8-1:-1:0)*child2(:,9:16)'*0.0235294 -3)'; % y
    child1(:, stringlength+3)=fun2(child1(:, stringlength+1),child1(:, stringlength+2));
    child2(:, stringlength+3)=fun2(child2(:, stringlength+1),child2(:, stringlength+2));
else
    child1=parent1;
    child2=parent2;
end