function [bus,line] = Rec_num(bus,line,node_num)
%�����ָ��ڵ�֮ǰ��˳��
global rb cb rl 
bus_temp = zeros(rb,cb);            % bus_temp����������ʱ���bus���������
for i = 1:rb                        % ����bus��������б�����¶�bus�������򲢴���bus_temp������
    k = bus(i,1);
%     disp(k);
    bus_temp(k,:) = bus(i,:);
end
bus = bus_temp;                     % ���¸�ֵ��bus�����bus��������±��

for i = 1:rl
    for j = 1:2
        for k = 1:rb
            if line(i,j) == node_num(k,1)
                line(i,j) = node_num(k,2);
                break
            end
        end
    end
end                                 %�ָ�line�����
       