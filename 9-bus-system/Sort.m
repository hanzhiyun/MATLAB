function [bus,line,node_num] = Sort(bus,line)
%�˺���������bus��line�ľ�����������Է������
%ȫ�ֱ���������
global rb rl n m
nPQ = 0;         %PQ�ڵ����   
nPV = 0;         %PV�ڵ����
nBN = 0;         %ƽ��ڵ���� balance node

for i = 1:rb
    type = bus(i,6);
    switch (type)
        case 1
            nPQ = nPQ + 1;
            PQ(nPQ,:) = bus(i,:);       %���㲢����PQ�ڵ�
        case 2
            nPV = nPV + 1;
            PV(nPV,:) = bus(i,:);       %���㲢����PV�ڵ�
        case 3
            nBN = nBN + 1;
            BN(nBN,:) = bus(i,:);       %���㲢����ƽ��ڵ�
    end
end
n = nPQ + nPV + nBN;% �ܽڵ����
m = nPQ;
bus = [PQ;PV;BN];            % ��bus����PQ��PV��ƽ��ڵ��˳����������
node_num = [[1:rb]',bus(:,1)]; % �����¾ɽڵ���ձ�

for i = 1:rl
    for j = 1:2
        for k = 1:rb
            if line(i,j) == node_num(k,2)
                line(i,j) = node_num(k,1);
                break
            end
        end
    end
end                        % �������Ժ�Ľڵ�˳���line�������±��