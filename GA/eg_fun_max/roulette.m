function [newpop] = roulette(oldpop, stringlength, Num)
% The selection operator implemented is routette wheel selection.The
% partial sum of the probabilities is accumulated in the vector prob.We
% also generate a vector rns containing normalized random numbers.By
% comparing the elements of the two vectors rns and prob, we decide the
% individuals which will take part in the new population.
totalfit=sum(oldpop(:,stringlength+2));
prob=oldpop(:,stringlength+2) / totalfit;
prob=cumsum(prob); % cumsum gives the cumulative sum of the elements
rns=sort(rand(Num,1)); % generates Num random numbers and sort them
fitin=1; newin=1; % select according to their positions on the cumulative line
while newin<=Num% Num is the number of items selected
    if (rns(newin)<prob(fitin))
        newpop(newin,:)=oldpop(fitin,:);
        newin=newin+1;
    else
        fitin=fitin+1;
    end
end