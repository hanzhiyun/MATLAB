function PowerFlowCalculate
%���������������
%����ȫ�ֱ���
global rb rl cb cl n m 

%��.mat�ļ��е������ݾ���bus��line
data = importdata('data_9bus1.mat');      
bus = data.bus;
line = data.line;
%======================bus��line�ĸ�ʽ==================================
%bus = [�ڵ���� �ڵ��ѹ �ڵ���� ע����й� ע����޹� �ڵ������] 
%�ڵ����� 3 ƽ��ڵ� 2 PV�ڵ� 1 PQ�ڵ�
%line = [�ڵ�i �ڵ�j ��·���� �翹 �絼 ���� ��ѹ����ȣ���ͨ��·Ϊ�㣩]   
%��·���迹��ʽҪ��Ϊ���͵�Ч��·��Y = 1/Z + Yl/2;                        
%======================================================================
%�õ�bus��line��������row����������column��
[rb,cb] = size(bus);       
[rl,cl] = size(line);

%���Ի�ȡ�������������Ƿ���ȷ
%disp(['This Bus have ' num2str(rb) ' row and ' num2str(cb) ' column']);
%disp(['This Line have ' num2str(rl) ' row and ' num2str(cl) ' column']);

[bus,line,node_num] = Sort(bus,line); 
%�۲������ľ���
% disp(bus);
% disp(line);
% disp(nPQ);
% disp(nPV);
% disp(node_num);

%�õ��ڵ㵼�ɾ���
Y = get_Y(line);
% disp(Y);

% [dP,dQ] = get_dPQ(Y,bus);
% disp(dP);
% disp(dQ);
% 
% J = get_J(Y,bus);
% disp(J);
format long
eps = 1.0e-10;  %�趨����
for k = 1:100
    [dP,dQ] = get_dPQ(Y,bus); 
    J = get_J(Y,bus);
%     [rj,cj] = size(J)
%     size(dP)
%     size(dQ)
    UD = zeros(m,m);
    for i = 1:m
        UD(i,i) = bus(i,2);         %�����ѹ�Խ���
    end
    
    dUth = J \ [dP;dQ];             %�����������
    dth = dUth(1:n - 1,1);          %����������ѹ��
    dU = UD*dUth(n:n + m - 1,1);    %�������������
    
    bus(1:m,2) = bus(1:m,2) + dU;           %������ѹ  
    bus(1:n - 1,3) = bus(1:n - 1,3) + dth;  %�������
    
    % �ж��Ƿ����㾫���������������������򷵻ؼ�������
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
fprintf(myf,'---------------ţ�٣�����ѷ������������----------\n\n �ڵ��������\n�ڵ�     �ڵ��ѹ      �ڵ���ǣ��Ƕȣ�      �ڵ�ע�빦��\n');
for i = 1:rb
    fprintf(myf,'%2.0f     ',bus_res(i,1));
    fprintf(myf,'%.6f      ',bus_res(i,2));
    fprintf(myf,'%.6f      ',bus_res(i,3));
    fprintf(myf,'%.6f + j %.6f\n',real(bus_res(i,4)),imag(bus_res(i,4)));
end
fprintf(myf,'\n��·��������\n�ڵ�I    �ڵ�J          ��·����S(I,J)               ��·����S(J,I)               ��·���dS(I,J)\n');
for i = 1:rl
    fprintf(myf,'%2.0f      ',S_res(i,1));
    fprintf(myf,'%2.0f         ',S_res(i,2));
    fprintf(myf,'%.6f + j %.6f       ',real(S_res(i,3)),imag(S_res(i,3)));
    fprintf(myf,'%.6f + j %.6f       ',real(S_res(i,4)),imag(S_res(i,4)));
    fprintf(myf,'%.6f + j %.6f\n',real(S_res(i,5)),imag(S_res(i,5)));
end
fprintf(myf,'\n��·�����ļ�������\n�ڵ�I    �ڵ�J          Ԫ��I��ĵ���             Ԫ��J��ĵ���\n');
for i = 1:rl
    fprintf(myf,'%2.0f      ',I_res(i,1));
    fprintf(myf,'%2.0f      ',I_res(i,2));
    fprintf(myf,'%.6f + j %.6f     ',real(I_res(i,3)),imag(I_res(i,3)));
    fprintf(myf,'%.6f + j %.6f\n',real(I_res(i,4)),imag(I_res(i,4)));
end
fclose(myf);                                       % ��������������ڡ�Result.txt��д��ڵ����������·������  �������

    