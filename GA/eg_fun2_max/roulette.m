function[newpop]=roulette(oldpop,stringlength,Num)
totalfit=sum((oldpop(:,stringlength+3)+1));%score scaled up by 1 to avoid -ve
prob=(oldpop(:,stringlength+3)+1) / totalfit; % scaled up by 1
prob=cumsum(prob);
rns=sort(rand(Num,1));
fitin=1; newin=1;
while newin<=Num% Numis the number of items selected
    if(rns(newin)<prob(fitin))
        newpop(newin,:)=oldpop(fitin,:);
        newin=newin+1;
    else
        fitin=fitin+1;
    end
end