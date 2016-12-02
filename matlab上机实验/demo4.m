%负荷有功无功；
P=input('请输入有功功率：');
Q=input('请输入无功功率：');
%设置迭代变量；
deltaP=1;
deltaQ=1;
%设置电压相位初值；
U=1;
Sita=1;

%迭代终止，while有点问题，用for替换
Uline=1;
Sitaline=1;

E = 1;
X = 0.08;
%采用循环；
for i = 1:1000 
    deltaP=P+E/X*U*sin(Sita);
    deltaQ=Q+E/X*U^2-1/X*U*cos(Sita);
    %计算雅可比矩阵；
    B1=-E/X*sin(Sita);
    B2=-E/X*U*cos(Sita);
    B3=-E/X*U+1/X*cos(Sita);
    B4=-1/X*U*sin(Sita);
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
    if ((Uline<0.001)&&(Sitaline<0.001))
        break;
    end
    if i == 1000
        msgbox('输入的参数使得计算结果不收敛！');
    end
end
%输出结果；
disp('电压幅值为');
disp(U);
disp('电压相角为');
disp(rad2deg(Sita));