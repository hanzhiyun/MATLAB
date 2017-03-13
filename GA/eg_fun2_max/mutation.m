function[child]=mutation(parent, pm, stringlength)
if(rand<pm)
    mpoint=round(rand*(stringlength-1))+1;
    child=parent;
    child(1,mpoint)=abs(parent(1,mpoint)-1);
    child(:, stringlength+1)=(2.^(8-1:-1:0)*child(:,1:8)'*0.0235294 -3)'; % x
    child(:, stringlength+2)=(2.^(8-1:-1:0)*child(:,9:16)'*0.0235294 -3)'; % y
    child(:, stringlength+3)=fun2(child(:, stringlength+1),child(:, stringlength+2));
else
    child=parent;
end