function [bus,line] = Rec_num(bus,line,node_num)
%用来恢复节点之前的顺序
global rb cb rl 
bus_temp = zeros(rb,cb);            % bus_temp矩阵用于临时存放bus矩阵的数据
for i = 1:rb                        % 利用bus矩阵的首列编号重新对bus矩阵排序并存入bus_temp矩阵中
    k = bus(i,1);
%     disp(k);
    bus_temp(k,:) = bus(i,:);
end
bus = bus_temp;                     % 重新赋值回bus，完成bus矩阵的重新编号

for i = 1:rl
    for j = 1:2
        for k = 1:rb
            if line(i,j) == node_num(k,1)
                line(i,j) = node_num(k,2);
                break
            end
        end
    end
end                                 %恢复line的序号
       