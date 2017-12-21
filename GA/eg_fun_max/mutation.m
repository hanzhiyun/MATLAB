function [child] = mutation(parent, pm, stringlength, b, a)
% Mutation alters one parent to produce a new child. The mutation point is
% mpoint. The real value and fitness of the new child are then computed.
if (rand<pm)
    mpoint=round(rand*(stringlength-1))+1;
    child=parent;
    child(1,mpoint)=abs(parent(1,mpoint)-1);
    child(:, stringlength+1)=(2.^(stringlength-1:-1:0)*child(:,1:stringlength)'*(b-a)/(2^stringlength-1)+a)';
    child(:, stringlength+2)=fun(child(:, stringlength+1));
else
    child=parent;
end