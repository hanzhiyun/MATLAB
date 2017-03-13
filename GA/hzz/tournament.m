function [newpop]=tournament(oldpop)
[x,y]=size(oldpop);
for i=1:(x-1)
    if (oldpop(i,14)<=oldpop((i+1),14))
        newpop(i,:)=oldpop(i,:);
    else
        newpop(i,:)=oldpop((i+1),:);
    end
end
j=x;
if (oldpop(j,14)<=oldpop(1,14))
    newpop(j,:)=oldpop(j,:);
else
    newpop(j,:)=oldpop(1,:);
end

    

  