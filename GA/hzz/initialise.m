function [pop]=initialise(popsize)

pop=[];
for row=1:popsize
 a=randperm(13);
 position=find(a==9);
 a(position)=[];
%for m=1:j
%  if a(m)==9
%      a(m)=[];break;
%  end
%end
 a=[9,a,14];
 pop=[pop;a];
end

format long;
dis_mat=xlsread('distance_matrix.xlsx','B2:N14');

for row=1:popsize
pop(row,14)=0;
for column=1:13
    if column==13
        pop(row,14)=dis_mat(pop(row,13),pop(row,1))+pop(row,14);
    else
        pop(row,14)=dis_mat(pop(row,column),pop(row,column+1))+pop(row,14);
    end
end
end

    


