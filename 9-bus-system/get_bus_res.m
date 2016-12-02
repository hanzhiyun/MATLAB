function bus_res = get_bus_res(bus)
%计算并返回节点数据结果
global rb
bus_res = zeros(rb,4);                   %bus_res矩阵储存着节点计算结果
bus_res(:,1:2) = bus(:,1:2);
bus_res(:,3) = bus(:,3)*180/pi;          %相角采用角度制
bus_res(:,4) = bus(:,4) + 1i*bus(:,5);   %注入功率