function main

popsize=20;
stringlength=16;
pc=0.7;
pm=0.5;

%plotting of the function
rowindex=1;
data=zeros(61*61,3);
for xx=-3:0.1:3
    for yy=-3:0.1:3
        data(rowindex,:)=[xx yy fun2(xx,yy)];
        rowindex= rowindex+ 1;
    end
end
% figure,plot3(data(:,1),data(:,2),data(:,3),-0.62,-0.83,1.67,'* g') % Figure 1

% Z=reshape(data(:,3),61,61);
% xaxis=-3:0.1:3;
% yaxis=-3:0.1:3;
% figure,mesh(xaxis,yaxis,Z) % Figure 2

% pop contains the initial populations
pop = initialise(popsize, stringlength);
% figure,plot3(data(:,1),data(:,2),data(:,3),pop(:,17),pop(:,18),pop(:,19),'* r') % Figure 3

%--Canonical Main Loop--------------------------------
Elite = 1; % Elite = 1 for elite evolution process
NumGeneration= 50;
plotdata=zeros(NumGeneration,3);
for igen= 1:NumGeneration
    newpop2=[]; % empty matrix
    for i=1:(popsize/2)
        % roulette wheel selection
        [newpop1]=roulette(pop,stringlength,2); % choose 2 items
        parent1 = newpop1(1,:); parent2 = newpop1(2,:);
        % crossover to generate new children
        [child1,child2]=crossover(parent1,parent2,pc,stringlength);
        newpop2= [newpop2;child1];
        newpop2= [newpop2;child2];
    end
    % mutations to generate new children
    newpop3=[];
    for i=1:popsize
        tmp= newpop2(i,:);
        [child3]=mutation(tmp, pm, stringlength);
        newpop3= [newpop3;child3];
    end
    % If the best from children in the current generation is better than the past value, replace.
    if(igen == 1)
        plotbest = max(max(newpop3(:,19)));
    else
        if (max(newpop3(:,19)) > plotbest)
            plotbest= max(newpop3(:,19));
        end
    end
    % The best from the current children, the best so far are saved.
    plotdata(igen,:) = [ igen max(newpop3(:,19)) plotbest]
    % for Elite evolution, the parents are also considered for the next generation
    if (Elite == 1)
        newpop3 = [pop ; newpop3 ];
        % truncation selection to generate parents for the next gen.
        [A,index]=sort(newpop3(:,19),1,'descend');
        newpop3sort=newpop3(index,:);
        pop=newpop3sort(1:popsize,:);
    else
        pop=newpop3;
    end
end % END of the FOR loop

hold on;
plot(plotdata(:,1), plotdata(:,2));
plot(plotdata(:,1), plotdata(:,3), '* r');























