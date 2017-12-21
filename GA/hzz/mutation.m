function [child]=mutation(parent,pm)
if (rand<pm)
    mpoint=round(rand(1,2)*(13-1))+1;
    child=parent;
    child([mpoint(1,1),mpoint(1,2)])=child([mpoint(1,2),mpoint(1,1)]);
    
    format long;
    dis_mat=xlsread('distance_matrix.xlsx','B2:N14');

    child(:,14)=0;
    for column=1:13
        if column==13
            child(:,14)=dis_mat(child(:,13),child(:,1))+child(:,14);
        else
            child(:,14)=dis_mat(child(:,column),child(:,column+1))+child(:,14);
        end
    end
else
    child=parent;
end