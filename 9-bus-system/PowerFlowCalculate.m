function PowerFlowCalculate
%潮流计算的主程序
%定义全局变量
global rb rl cb cl n m 

%从.mat文件中导入数据矩阵bus和line
data = importdata('data_9bus1.mat');      
bus = data.bus;
line = data.line;
%======================bus和line的格式==================================
%bus = [节点序号 节点电压 节点相角 注入的有功 注入的无功 节点的类型] 
%节点类型 3 平衡节点 2 PV节点 1 PQ节点
%line = [节点i 节点j 线路电阻 电抗 电导 电纳 变压器变比（普通线路为零）]   
%线路的阻抗形式要变为π型等效电路，Y = 1/Z + Yl/2;                        
%======================================================================
%得到bus和line的行数（row）和列数（column）
[rb,cb] = size(bus);       
[rl,cl] = size(line);

%测试获取的行数和列数是否正确
%disp(['This Bus have ' num2str(rb) ' row and ' num2str(cb) ' column']);
%disp(['This Line have ' num2str(rl) ' row and ' num2str(cl) ' column']);

[bus,line,node_num] = Sort(bus,line); 
%观察排序后的矩阵
% disp(bus);
% disp(line);
% disp(nPQ);
% disp(nPV);
% disp(node_num);

%得到节点导纳矩阵
Y = get_Y(line);
% disp(Y);

% [dP,dQ] = get_dPQ(Y,bus);
% disp(dP);
% disp(dQ);
% 
% J = get_J(Y,bus);
% disp(J);
format long
eps = 1.0e-10;  %设定误差精度
for k = 1:100
    [dP,dQ] = get_dPQ(Y,bus); 
    J = get_J(Y,bus);
%     [rj,cj] = size(J)
%     size(dP)
%     size(dQ)
    UD = zeros(m,m);
    for i = 1:m
        UD(i,i) = bus(i,2);         %计算电压对角阵
    end
    
    dUth = J \ [dP;dQ];             %求解修正方程
    dth = dUth(1:n - 1,1);          %计算修正电压量
    dU = UD*dUth(n:n + m - 1,1);    %计算修正相角量
    
    bus(1:m,2) = bus(1:m,2) + dU;           %修正电压  
    bus(1:n - 1,3) = bus(1:n - 1,3) + dth;  %修正相角
    
    % 判断是否满足精度误差，如满足则跳出，否则返回继续迭代
    if (max(abs(dU)) < eps) && (max(abs(dth)) < eps)
        break                           
    end
end

bus = set_PQ(Y,bus);
% disp(bus);

[bus,line] = Rec_num(bus,line,node_num);
% disp(bus);
% disp(line);

YtYm = get_YtYm(line);

bus_res = get_bus_res(bus);

S_res = get_S(bus,line,YtYm);

I_res = get_I(bus,S_res);

% disp(bus_res);
% disp(S_res);
% disp(I_res);
    
myf = fopen('Result.txt','w');
fprintf(myf,'---------------牛顿－拉夫逊法潮流计算结果----------\n\n 节点计算结果：\n节点     节点电压      节点相角（角度）      节点注入功率\n');
for i = 1:rb
    fprintf(myf,'%2.0f     ',bus_res(i,1));
    fprintf(myf,'%.6f      ',bus_res(i,2));
    fprintf(myf,'%.6f      ',bus_res(i,3));
    fprintf(myf,'%.6f + j %.6f\n',real(bus_res(i,4)),imag(bus_res(i,4)));
end
fprintf(myf,'\n线路计算结果：\n节点I    节点J          线路功率S(I,J)               线路功率S(J,I)               线路损耗dS(I,J)\n');
for i = 1:rl
    fprintf(myf,'%2.0f      ',S_res(i,1));
    fprintf(myf,'%2.0f         ',S_res(i,2));
    fprintf(myf,'%.6f + j %.6f       ',real(S_res(i,3)),imag(S_res(i,3)));
    fprintf(myf,'%.6f + j %.6f       ',real(S_res(i,4)),imag(S_res(i,4)));
    fprintf(myf,'%.6f + j %.6f\n',real(S_res(i,5)),imag(S_res(i,5)));
end
fprintf(myf,'\n线路电流的计算结果：\n节点I    节点J          元件I侧的电流             元件J侧的电流\n');
for i = 1:rl
    fprintf(myf,'%2.0f      ',I_res(i,1));
    fprintf(myf,'%2.0f      ',I_res(i,2));
    fprintf(myf,'%.6f + j %.6f     ',real(I_res(i,3)),imag(I_res(i,3)));
    fprintf(myf,'%.6f + j %.6f\n',real(I_res(i,4)),imag(I_res(i,4)));
end
fclose(myf);                                       % 迭代结束后继续在“Result.txt”写入节点计算结果和线路计算结果  程序结束

    