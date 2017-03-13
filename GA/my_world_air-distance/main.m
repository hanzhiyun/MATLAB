function main 

popsize = 40;
stringlength = 13;
pc = 0.7;   % pc is the probability of crossover.
pm = 0.5;  % pm is the probability of mutation.
% Num =4;

pop = initialise(popsize, stringlength);

% To test the roulette() selection algorithm
% Num is the number of items chosen
% [newpop]=roulette(pop,stringlength,Num)

% To test crossover() using two individual parents
% parent1 = pop(1, :);
% parent2 = pop(2, :);
% [child1, child2] = crossover(parent1,parent2,pc,stringlength)


%--Canonical Main Loop--------------------------------
Elite = 1; % Elite = 1 for elite evolution process
NumGeneration= 50;
plotdata = zeros(NumGeneration, 4);
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
        plotbest = max(newpop3(:,29));
        mindis = min(newpop3(:,28));
    else
        if (max(newpop3(:,29)) > plotbest)
            plotbest= max(newpop3(:,29));
            mindis = min(newpop3(:,28));
        end
    end
    % The best from the current children, the best so far are saved.
    plotdata(igen,:) = [ igen max(newpop3(:,29)) plotbest mindis];
    % for Elite evolution, the parents are also considered for the next generation
    if (Elite == 1)
        newpop3 = [pop ; newpop3 ];
        % truncation selection to generate parents for the next gen.
        [~,index]=sort(newpop3(:,29),1,'descend');
        newpop3sort=newpop3(index,:);
        pop=newpop3sort(1:popsize,:);
    else
        pop=newpop3;
    end
end % END of the FOR loop
figure(1);
hold off;
plot(plotdata(:,1), plotdata(:,2));
hold on;
plot(plotdata(:,1), plotdata(:,3), '* r');
hold off;
figure(2);
plot(plotdata(:,1), plotdata(:,4));

disp('The shortest distance is ');
disp(plotdata(igen, 4));





