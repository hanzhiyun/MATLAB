function [child1 child2]=crossover(parent1,parent2,pc)
if (rand<pc)
    cpoint=round(rand*(13-2))+1;
    child1=[parent1(:,1:cpoint) parent2(:,cpoint+1:13)];
    child2=[parent2(:,1:cpoint) parent1(:,cpoint+1:13)];
    
    num=1:13;
    
    %repair
    [~,p]=unique(child1,'first');%????????????????????
    [x,~]=setdiff(num,child1);%missed number
    [y,~]=setdiff(num,p);%repeated position
    child1(y)=x;%repair child1
    [~,p]=unique(child2,'first');
    [x,~]=setdiff(num,child2);%missed number
    [y,~]=setdiff(num,p);%repeated position
    child2(y)=x;%repair child2
    
    format long;
    dis_mat=xlsread('distance_matrix.xlsx','B2:N14');
    
    %distance of child1
    child1(:,14)=0;
    for column=1:13
        if column==13
            child1(:,14)=dis_mat(child1(:,13),child1(:,1))+child1(:,14);
        else
            child1(:,14)=dis_mat(child1(:,column),child1(:,column+1))+child1(:,14);
        end
    end
    %distance of child2
    child2(:,14)=0;
    for column=1:13
        if column==13
            child2(:,14)=dis_mat(child2(:,13),child2(:,1))+child2(:,14);
        else
            child2(:,14)=dis_mat(child2(:,column),child2(:,column+1))+child2(:,14);
        end
    end
else
    child1=parent1;
    child2=parent2;
end
        
    
    
    
    