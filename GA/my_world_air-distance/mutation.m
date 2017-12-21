function [child] = mutation(parent, pm, stringlength)
% Mutation alters one parent to produce a new child. The mutation point is
% mpoint. The real value and fitness of the new child are then computed.
if (rand<pm)
    mpoint=round(rand*(stringlength-1))+1;
    child=parent;
%     child(1,mpoint)=abs(parent(1,mpoint)-1);
    child(1,mpoint)=rand;
    
%     mpoint1=round(rand*(stringlength-1))+1;
%     mpoint2=round(rand*(stringlength-1))+1;
%     child=parent;
%     child([mpoint1,mpoint2]) = child([mpoint2,mpoint1]); 

    child(:, stringlength+1:stringlength+14) = fun_x(child(:, 1:stringlength));
    child(:, stringlength+15) = fun(child(:, stringlength+1:stringlength+14));
    child(:, stringlength+16) = 100./child(:, stringlength+15);
else
    child=parent;
end