clear;clc;
popsize=10;pc=0.7;pm=0.1;
%pop contains the initial populations
pop=initialise(popsize);
%--------Canonical Main Loop-----------------------------------------------
Elite=1;%Elite=1 for elite evolution process
NumGeneration=100;
plotdata=zeros(NumGeneration,3);
for igen=1:NumGeneration
[newpop1]=tournament(pop);%tournament selection
%crossover to generate new children, newpop2 is double the population size
newpop2=[];%empty matrix
for i=1:popsize%randomly select two individuals for crossover
    index1=ceil(rand*popsize);index2=ceil(rand*popsize);
    parent1=newpop1(index1,:);parent2=newpop1(index2,:);
    [child1 child2]=crossover(parent1,parent2,pc);
    newpop2=[newpop2;child1];newpop2=[newpop2;child2];
end
%mutation to generate new children
newpop3=[];
for i=1:2*popsize
    tmpparent=newpop2(i,:);
    [child3]=mutation(tmpparent,pm);
    newpop3=[newpop3;child3];
end
averageFit=sum(newpop3(:,14))/(2*popsize);
plotdata(igen,:)=[igen,min(newpop3(:,14)),averageFit];
%for Elite evolution, the parent are also considered for the next
%generation
if (Elite==1)
    newpop3=[newpop1;newpop3];
    %truncation selection to generate parents for the next gen
    [A,index]=sort(newpop3(:,14));
    newpop3sort=newpop3(index,:);
    pop=newpop3sort([1:popsize],:);
else
    [A,index]=sort(newpop3(:,14));
    newpop3sort=newpop3(index,:);
    pop=newpop3sort([1:popsize],:);
end
end%END of the FOR LOOP
shortest=pop(1,:)
figure,plot(plotdata(:,1),plotdata(:,2),plotdata(:,1),plotdata(:,3),'*');

    

    
    

