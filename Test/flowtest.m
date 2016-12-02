
%两节点，使用牛拉法迭代计算；
%王柯  405 兴隆山14号楼
%负荷有功无功；
P=2;
Q=1;
%设置迭代变量；
deltaP=1;
deltaQ=1;
%设置电压相位初值；
U=1;
Sita=1;

%迭代终止，while有点问题，用for替换
Uline=1;
Sitaline=1;

%采用循环；
while(1)  
    deltaP=P+10*U*sin(Sita);
    deltaQ=Q+10*U^2-10*U*cos(Sita);
    %计算雅可比矩阵；
    B1=-10*sin(Sita);
    B2=-10*U*cos(Sita);
    B3=-20*U+10*cos(Sita);
    B4=-10*U*sin(Sita);
    %雅可比矩阵；
    B=[B1 B2;B3 B4];
    %计算修正量
    delta=B\[deltaP;deltaQ];
    %修正电压幅值和相角；
    U=U+delta(1,1);
    Sita=Sita+delta(2,1);
    %终止条件更新；
    Uline=abs(delta(1,1));
    Sitaline=abs(delta(2,1));
    %满足条件迭代终止；
    if ((Uline<0.01)&&(Sitaline<0.01))
        break;
    end
end
%输出结果；
input('电压幅值为');
disp(U);
input('电压相角为');
disp(Sita);