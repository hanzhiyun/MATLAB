function bus_res = get_bus_res(bus)
%���㲢���ؽڵ����ݽ��
global rb
bus_res = zeros(rb,4);                   %bus_res���󴢴��Žڵ������
bus_res(:,1:2) = bus(:,1:2);
bus_res(:,3) = bus(:,3)*180/pi;          %��ǲ��ýǶ���
bus_res(:,4) = bus(:,4) + 1i*bus(:,5);   %ע�빦��