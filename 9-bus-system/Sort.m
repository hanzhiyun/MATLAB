function [bus,line,node_num] = Sort(bus,line)
%此函数用来对bus和line的矩阵进行排列以方便计算
%全局变量的声明
global rb rl n m
nPQ = 0;         %PQ节点个数   
nPV = 0;         %PV节点个数
nBN = 0;         %平衡节点个数 balance node

for i = 1:rb
    type = bus(i,6);
    switch (type)
        case 1
            nPQ = nPQ + 1;
            PQ(nPQ,:) = bus(i,:);       %计算并储存PQ节点
        case 2
            nPV = nPV + 1;
            PV(nPV,:) = bus(i,:);       %计算并储存PV节点
        case 3
            nBN = nBN + 1;
            BN(nBN,:) = bus(i,:);       %计算并储存平衡节点
    end
end
n = nPQ + nPV + nBN;% 总节点个数
m = nPQ;
bus = [PQ;PV;BN];            % 对bus矩阵按PQ、PV、平衡节点的顺序重新排序
node_num = [[1:rb]',bus(:,1)]; % 生成新旧节点对照表

for i = 1:rl
    for j = 1:2
        for k = 1:rb
            if line(i,j) == node_num(k,2)
                line(i,j) = node_num(k,1);
                break
            end
        end
    end
end                        % 按排序以后的节点顺序对line矩阵重新编号