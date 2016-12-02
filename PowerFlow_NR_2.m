function [bus_res,S_res] = PowerFlow_NR_2          % 牛顿-拉夫逊法解潮流方程的主程序
%%%%%%%%%%%%%%%%%%%%%  by longdinhohe  %%%%%%%%%%%%%%%%%%%%%  http://blog.sina.com.cn/longdinhohe  %%%%%%%%%%%%%%%%%%%%%
[bus,line] = OpDF_;                                % 打开数据文件的子程序，返回bus（节点数据）和line（线路数据）回主程序

[nb,mb]=size(bus);
[nl,ml]=size(line);                                % 计算bus和line矩阵的行数和列数

[bus,line,nPQ,nPV,nodenum] = Num_(bus,line);       % 对节点重新排序的子程序

Y = y_(bus,line);                                  % 计算节点导纳矩阵的子程序

myf = fopen('Result.m','w');
fprintf(myf,'--------------- by longdinhohe --------------- http://blog.sina.com.cn/longdinhohe ---------------\n\n');
fclose(myf);                                       % 在当前目录下生成“Result.m”文件，写入节点导纳矩阵

format long
EPS = 1.0e-10;                                     % 设定误差精度
for t = 1:100                                     % 开始迭代计算，设定最大迭代次数为100，以便不收敛情况下及时跳出
    
    [dP,dQ] = dPQ_(Y,bus,nPQ,nPV);                 % 计算功率偏差dP和dQ的子程序
    
    J = Jac_(bus,Y,nPQ);                           % 计算雅克比矩阵的子程序
    
    UD = zeros(nPQ,nPQ);
    
    for i = 1:nPQ
        UD(i,i) = bus(i,2);                        % 生成电压对角矩阵
    end
    
    dAngU = J \ [dP;dQ];
    dAng = dAngU(1:nb-1,1);                        % 计算相角修正量
    dU = UD*(dAngU(nb:nb+nPQ-1,1));                % 计算电压修正量
    
    bus(1:nPQ,2) = bus(1:nPQ,2) - dU;              % 修正电压
    bus(1:nb-1,3) = bus(1:nb-1,3) - dAng;          % 修正相角
    
    if (max(abs(dU))<EPS)&&(max(abs(dAng))<EPS)
        break
    end                                            % 判断是否满足精度误差，如满足则跳出，否则返回继续迭代
    
end

bus = PQ_(bus,Y,nPQ,nPV);                          % 计算每个节点的有功和无功注入的子程序

[bus,line] = ReNum_(bus,line,nodenum);             % 对节点恢复编号的子程序

YtYm = YtYm_(line);                                % 计算线路的等效Yt和Ym的子程序，以计算线路潮流

bus_res = bus_res_(bus);                           % 计算节点数据结果的子程序

S_res = S_res_(bus,line,YtYm);                     % 计算线路潮流的子程序

myf = fopen('Result.m','a');
fprintf(myf,'---------------牛顿－拉夫逊法潮流计算结果----------\n\n 节点计算结果：\n节点     节点电压      节点相角（角度）      节点注入功率\n');
for i = 1:nb
    fprintf(myf,'%2.0f      ',bus_res(i,1));
    fprintf(myf,'%.6f      ',bus_res(i,2));
    fprintf(myf,'%.6f      ',bus_res(i,3));
    fprintf(myf,'%.6f + j %.6f\n',real(bus_res(i,4)),imag(bus_res(i,4)));
end
fprintf(myf,'\n线路计算结果：\n节点I    节点J          线路功率S(I,J)               线路功率S(J,I)               线路损耗dS(I,J)\n');
for i = 1:nl
    fprintf(myf,'%2.0f      ',S_res(i,1));
    fprintf(myf,'%2.0f      ',S_res(i,2));
    fprintf(myf,'%.6f + j %.6f     ',real(S_res(i,3)),imag(S_res(i,3)));
    fprintf(myf,'%.6f + j %.6f     ',real(S_res(i,4)),imag(S_res(i,4)));
    fprintf(myf,'%.6f + j %.6f\n',real(S_res(i,5)),imag(S_res(i,5)));
end
fclose(myf);                                       % 迭代结束后继续在“Result.m”写入节点计算结果和线路计算结果  程序结束



%子程序1  "OpDF_.m"  作用为打开数据文件

function [bus,line] = OpDF_
[dfile,pathname]=uigetfile('*.m','Select Data File');   % 数据文件类型为m文件，窗口标题为“Select Data File”
if pathname == 0
    error(' you must select a valid data file')         % 如果没有选择有效文件，则出现错误提示
else
    lfile =length(dfile);                               % 读取文件字符串长度
    
    eval(dfile(1:lfile-2));                           % 去除后缀，打开文件 ！注意！新浪博客中"eval"函数会自动加上"_r"后缀，此处的函数名是"eval"而不是"eval_r"，拷贝后请去除"_r"后缀
end    
    
    
%子程序2  "Num.m"  作用为对节点重排序，并修改相应的线路数据

function [bus,line,nPQ,nPV,nodenum] = Num_(bus,line)
[nb,mb]=size(bus);
[nl,ml]=size(line);
nSW = 0;                   % nSW为平衡节点个数
nPV = 0;                   % nPV为PV节点个数
nPQ = 0;                   % nPQ为PQ节点个数
for i = 1:nb,              % nb为总节点数
    type= bus(i,6);
    if type == 3,
        nSW = nSW + 1;
        SW(nSW,:)=bus(i,:);% 计算并储存平衡节点
    elseif type == 2,
        nPV = nPV +1;
        PV(nPV,:)=bus(i,:);% 计算并储存PV节点
    else
        nPQ = nPQ + 1;
        PQ(nPQ,:)=bus(i,:);% 计算并储存PQ节点
    end
end

bus=[PQ;PV;SW];            % 对bus矩阵按PQ、PV、平衡节点的顺序重新排序
nodenum=[[1:nb]' bus(:,1)];% 生成新旧节点对照表

for i=1:nl
    for j=1:2
        for k=1:nb
            if line(i,j)==nodenum(k,2)
                line(i,j)=nodenum(k,1);
                break
            end
        end
    end
end                        % 按排序以后的节点顺序对line矩阵重新编号



%子程序3  "y_.m"  作用为计算节点导纳矩阵

function Y = y_(bus,line)

    [nb,mb]=size(bus);
    [nl,ml]=size(line);

    Y=zeros(nb,nb);                        % 对导纳矩阵赋初值0
    for k=1:nl
        I=line(k,1);
        J=line(k,2);
        Zt=line(k,3)+j*line(k,4);          % 读入线路参数
        if Zt~=0
            Yt=1/Zt;                       % 接地支路不计算Yt
        end
        Ym=line(k,5)+j*line(k,6);
        K=line(k,7);

        if (K==0)&(J~=0)                   % 普通线路: K=0
            Y(I,I)=Y(I,I)+Yt+Ym;
            Y(J,J)=Y(J,J)+Yt+Ym;
            Y(I,J)=Y(I,J)-Yt;
            Y(J,I)=Y(I,J);
        end

        if (K==0)&(J==0)                   % 对地支路: K=0,J=0,R=X=0
            Y(I,I)=Y(I,I)+Ym;
        end

        if K>0                             % 变压器线路: Zt和Ym为折算到i侧的值,K在j侧
            Y(I,I)=Y(I,I)+Yt+Ym;
            Y(J,J)=Y(J,J)+Yt/K/K;
            Y(I,J)=Y(I,J)-Yt/K;
            Y(J,I)=Y(I,J);
        end

        if K<0                             % 变压器线路: Zt和Ym为折算到K侧的值,K在i侧
            Y(I,I)=Y(I,I)+Yt+Ym;
            Y(J,J)=Y(J,J)+K*K*Yt;
            Y(I,J)=Y(I,J)+K*Yt;
            Y(J,I)=Y(I,J);
        end
    end



%子程序4  "dPQ_.m"  作用为计算功率偏差

function [dP,dQ] =dPQ_(Y,bus,nPQ,nPV)  %  nPQ、nPV为相应节点个数

    n = nPQ + nPV +1;                      % 总节点个数

    dP = bus(1:n-1,4);
    dQ = bus(1:nPQ,5);                     % 对dP和dQ赋初值  PV节点不需计算dQ 平衡节点不参与计算
    for i = 1:n-1
        for j = 1:n
            dP(i,1) = dP(i,1)-bus(i,2)*bus(j,2)*(real(Y(i,j))*cos(bus(i,3)-bus(j,3))+imag(Y(i,j))*sin(bus(i,3)-bus(j,3)));
            if i<nPQ+1
                dQ(i,1) = dQ(i,1)-bus(i,2)*bus(j,2)*(real(Y(i,j))*sin(bus(i,3)-bus(j,3))-imag(Y(i,j))*cos(bus(i,3)-bus(j,3)));
            end
        end
    end                                    % 利用循环计算求取dP和dQ



%子程序5  "Jac_.m"  作用为计算雅克比矩阵

function J = Jac_(bus,Y,nPQ)

[nb,mb]=size(bus);

H = zeros(nb-1,nb-1);
N = zeros(nb-1,nPQ);
K = zeros(nPQ,nb-1);
L = zeros(nPQ,nPQ);         % 将雅克比矩阵分块，即：J = [H   N; K   L]，并初始化

Qi = zeros(nb-1,1);
Pi = zeros(nb-1,1);

for i = 1:nb-1
    for j = 1:nb
        Pi(i,1)=Pi(i,1)+bus(i,2)*bus(j,2)*(real(Y(i,j))*cos(bus(i,3)-bus(j,3))+imag(Y(i,j))*sin(bus(i,3)-bus(j,3)));
        Qi(i,1)=Qi(i,1)+bus(i,2)*bus(j,2)*(real(Y(i,j))*sin(bus(i,3)-bus(j,3))-imag(Y(i,j))*cos(bus(i,3)-bus(j,3)));
    end
end                         % 初始化并计算Qi和Pi

for i = 1:nb-1
    for j = 1:nb-1
        if i~=j
            H(i,j)=-bus(i,2)*bus(j,2)*(real(Y(i,j))*sin(bus(i,3)-bus(j,3))-imag(Y(i,j))*cos(bus(i,3)-bus(j,3)));
        else
            H(i,j)=Qi(i,1)+imag(Y(i,j))*((bus(i,2))^2);
        end                 % 分别计算H矩阵的对角及非对角元素

        if  j < nPQ+1
            if i~=j
                N(i,j)=-bus(i,2)*bus(j,2)*(real(Y(i,j))*cos(bus(i,3)-bus(j,3))+imag(Y(i,j))*sin(bus(i,3)-bus(j,3)));
            else
                N(i,j)=-Pi(i,1)-real(Y(i,j))*((bus(i,2))^2);
            end
        end                 % 分别计算N矩阵的对角及非对角元素

        if  i < nPQ+1
            if i~=j
                K(i,j)=bus(i,2)*bus(j,2)*(real(Y(i,j))*cos(bus(i,3)-bus(j,3))+imag(Y(i,j))*sin(bus(i,3)-bus(j,3)));
            else
                K(i,j)=-Pi(i,1)+real(Y(i,j))*((bus(i,2))^2);
            end             % 分别计算K矩阵的对角及非对角元素

            if j < nPQ+1
                if i~=j
                    L(i,j)=-bus(i,2)*bus(j,2)*(real(Y(i,j))*sin(bus(i,3)-bus(j,3))-imag(Y(i,j))*cos(bus(i,3)-bus(j,3)));
                else
                    L(i,j)=-Qi(i,1)+imag(Y(i,j))*((bus(i,2))^2);
                end
            end             % 分别计算L矩阵的对角及非对角元素
        end
    end
end

J = [H   N; K   L];         % 生成雅克比矩阵



%子程序6  "PQ_.m"  作用为计算每个节点的功率注入

function bus = PQ_(bus,Y,nPQ,nPV)
n = nPQ+nPV+1;        % n为总节点数
for i = nPQ+1:n-1
    for j = 1:n
        bus(i,5)=bus(i,5)+bus(i,2)*bus(j,2)*(real(Y(i,j))*sin(bus(i,3)-bus(j,3))-imag(Y(i,j))*cos(bus(i,3)-bus(j,3)));
    end
end                   % 利用公式计算PV节点的无功注入
for j =1:n
    bus(n,4)=bus(n,4)+bus(n,2)*bus(j,2)*(real(Y(n,j))*cos(bus(n,3)-bus(j,3))+imag(Y(n,j))*sin(bus(n,3)-bus(j,3)));
    bus(n,5)=bus(n,5)+bus(n,2)*bus(j,2)*(real(Y(n,j))*sin(bus(n,3)-bus(j,3))-imag(Y(n,j))*cos(bus(n,3)-bus(j,3)));
end                   % 计算平衡节点的无功及有功注入



%子程序7  "ReNum_.m"  作用为对节点和线路数据恢复编号

function [bus,line] = ReNum_(bus,line,nodenum)
[nb,mb]=size(bus);
[nl,ml]=size(line);
bus_temp = zeros(nb,mb);               % bus_temp矩阵用于临时存放bus矩阵的数据
k = 1;
for i = 1 :nb
    for j = 1 : nb
        if bus(j,1) == k
            bus_temp(k,:) = bus(j,:);
            k = k + 1;
        end
    end
end                                   % 利用bus矩阵的首列编号重新对bus矩阵排序并存入bus_temp矩阵中
bus = bus_temp;                       % 重新赋值回bus，完成bus矩阵的重新编号

for i=1:nl
    for j=1:2
        for k=1:nb
            if line(i,j)==nodenum(k,1)
                line(i,j)=nodenum(k,2);
                break
            end
        end
    end
end                                   % 恢复line的编号



%子程序8  "YtYm_.m"  作用为计算线路的等效Yt和Ym，以计算线路潮流

function YtYm = YtYm_(line)

[nl,ml]=size(line);

YtYm = zeros(nl,5);                   % 对YtYm矩阵赋初值0
YtYm(:,1:2) = line(:,1:2);            % 矩阵前两列为线路两段节点编号，后三列分别为线路等效Yt，i侧的等效Ym，j侧的等效Ym
j = sqrt(-1);
for k=1:nl
    I=line(k,1);
    J=line(k,2);
    Zt=line(k,3)+j*line(k,4);
    if Zt~=0
        Yt=1/Zt;
    end
    Ym=line(k,5)+j*line(k,6);
    K=line(k,7);

    if (K==0)&(J~=0)                 % 普通线路: K=0
        YtYm(k,3) = Yt;
        YtYm(k,4) = Ym;
        YtYm(k,5) = Ym;
    end

    if (K==0)&(J==0)                 % 对地支路: K=0,J=0,R=X=0
        YtYm(k,4) = Ym;
    end

    if K>0                           % 变压器线路: Zt和Ym为折算到i侧的值,K在j侧
        YtYm(k,3) = Yt/K;
        YtYm(k,4) = Ym+Yt*(K-1)/K;
        YtYm(k,5) = Yt*(1-K)/K/K;
    end

    if K<0                           % 变压器线路: Zt和Ym为折算到K侧的值,K在i侧
        YtYm(k,3) = -Yt*K;
        YtYm(k,4) = Ym+Yt*(1+K);
        YtYm(k,5) = Yt*(K^2+K);
    end
end



%子程序9  "bus_res_.m"  计算并返回节点数据结果

function bus_res = bus_res_(bus)
    [nb,mb]=size(bus);
    bus_res = zeros(nb,4);                          % bus_res矩阵储存着节点计算结果
    bus_res(:,1:2) = bus(:,1:2);
    bus_res(:,3) = bus(:,3) *180 / pi;              % 相角采用角度制
    bus_res(:,4) = bus(:,4) + (sqrt(-1))*bus(:,5);  % 注入功率



%子程序10  "S_res_.m"  计算并返回线路潮流

function S_res = S_res_(bus,line,YtYm)
[nl,ml]=size(line);
S_res = zeros(nl,5);             % S_res矩阵储存着线路潮流计算结果
S_res(:,1:2) = line(:,1:2);      % 前两列为节点编号
for k=1:nl
    I = S_res(k,1);
    J = S_res(k,2);
    if (J~=0)&(I~=0)
        S_res(k,3)=bus(I,2)^2*(conj(YtYm(k,3))+conj(YtYm(k,4)))-bus(I,2)*bus(J,2)*(cos(bus(I,3))+j*sin(bus(I,3)))*(conj(cos(bus(J,3))+j*sin(bus(J,3))))*conj(YtYm(k,3));
        S_res(k,4)=bus(J,2)^2*(conj(YtYm(k,3))+conj(YtYm(k,5)))-bus(I,2)*bus(J,2)*(conj(cos(bus(I,3))+j*sin(bus(I,3))))*(cos(bus(J,3))+j*sin(bus(J,3)))*conj(YtYm(k,3));
        S_res(k,5)=S_res(k,3) + S_res(k,4);          % 利用公式计算非接地支路的潮流
    elseif J==0
        S_res(k,3)=bus(I,2)^2*conj(YtYm(k,4));
        S_res(k,5)=S_res(k,3)+S_res(k,4);
    else
        S_res(k,4)=bus(J,2)^2*conj(YtYm(k,5));
        S_res(k,5)=S_res(k,3)+S_res(k,4);            % 利用公式计算接地支路的潮流
    end
end
