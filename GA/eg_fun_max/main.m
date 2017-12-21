function main

popsize = 30;
stringlength = 20;
pc = 0.95;   % pc is the probability of crossover.
pm = 0.05;  % pm is the probability of mutation.
a = 0;
b = 1;
Num = 4;

% % plotting of the function
% aa=[];
% for i=0:0.01:1
%     tmpa=fun(i);
%     aa=[aa tmpa];
% end
% plot(aa)% Figure 1(slide 11)
aa = fun(0:0.01:1);

% pop contains the initial populations
pop = initialise(popsize, stringlength,b,a);

% To test crossover() using two individual parents
% parent1 = pop(1, 1:stringlength+2);
% parent2 = pop(2, 1:stringlength+2);
% [child1, child2] = crossover(parent1,parent2,pc,stringlength,b,a);

% To test mutation()
% parent3 = pop(3,[1:stringlength+2]);
% [child3]=mutation(parent3, pm, stringlength,b,a);

% To test the roulette() selection algorithm
% Num is the number of items chosen
% [newpop]=roulette(pop,stringlength,Num);

%--Canonical Main Loop----------------------------------------
Elite = 1; % Elite = 1 if elite evolution process is chosen

% initial figure
plot(pop(:,21), pop(:,22),'*',[0:0.01:1],aa) % Figure 2

maxvals = zeros(10, 4);

for igen = 1:10
    % roulette wheel selection
    [newpop1]=roulette(pop,stringlength,popsize); % number of selected items equals to popsize
    % crossover to generate new children, newpop2 is double the population size
    newpop2=[]; % empty matrix
    for i= 1:popsize % randomly select two individuals for crossover
        index1 = ceil(rand*popsize); 
        index2 = ceil(rand*popsize);
        parent1 = newpop1(index1, 1:stringlength+2); 
        parent2 = newpop1(index2, 1:stringlength+2);
        [child1,child2]=crossover(parent1, parent2, pc, stringlength, b, a);
        newpop2= [newpop2;child1]; 
        newpop2= [newpop2;child2];
    end
    % mutations to generate new children
    newpop3=[];
    for i=1:2*popsize
        tmpparent= newpop2(i, 1:stringlength+2);
        [child3]=mutation(tmpparent, pm, stringlength, b, a);
        newpop3 = [newpop3; child3];
    end
    maxvals(igen, :) = [ igen max(newpop1(:,22)') max(newpop2(:,22)') max(newpop3(:,22)') ];
    % If Elite evolution is chosen, the selected parents are considered for the next generation as well
    if (Elite == 1)
        newpop3 = [newpop1 ; newpop3 ];
    end
    % truncation selection to generate parents for the next generation
    [A, index]=sort(newpop3(:, stringlength+2), 1, 'descend');
    newpop3sort=newpop3(index,:);
    pop=newpop3sort(1:popsize, :);
end % END of the for loop on igen

disp('show maxvals:');
disp(maxvals);























