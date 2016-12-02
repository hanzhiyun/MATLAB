function [bus_res,S_res] = PowerFlow_NR_2          % ţ��-����ѷ���⳱�����̵�������
%%%%%%%%%%%%%%%%%%%%%  by longdinhohe  %%%%%%%%%%%%%%%%%%%%%  http://blog.sina.com.cn/longdinhohe  %%%%%%%%%%%%%%%%%%%%%
[bus,line] = OpDF_;                                % �������ļ����ӳ��򣬷���bus���ڵ����ݣ���line����·���ݣ���������

[nb,mb]=size(bus);
[nl,ml]=size(line);                                % ����bus��line���������������

[bus,line,nPQ,nPV,nodenum] = Num_(bus,line);       % �Խڵ�����������ӳ���

Y = y_(bus,line);                                  % ����ڵ㵼�ɾ�����ӳ���

myf = fopen('Result.m','w');
fprintf(myf,'--------------- by longdinhohe --------------- http://blog.sina.com.cn/longdinhohe ---------------\n\n');
fclose(myf);                                       % �ڵ�ǰĿ¼�����ɡ�Result.m���ļ���д��ڵ㵼�ɾ���

format long
EPS = 1.0e-10;                                     % �趨����
for t = 1:100                                     % ��ʼ�������㣬�趨����������Ϊ100���Ա㲻��������¼�ʱ����
    
    [dP,dQ] = dPQ_(Y,bus,nPQ,nPV);                 % ���㹦��ƫ��dP��dQ���ӳ���
    
    J = Jac_(bus,Y,nPQ);                           % �����ſ˱Ⱦ�����ӳ���
    
    UD = zeros(nPQ,nPQ);
    
    for i = 1:nPQ
        UD(i,i) = bus(i,2);                        % ���ɵ�ѹ�ԽǾ���
    end
    
    dAngU = J \ [dP;dQ];
    dAng = dAngU(1:nb-1,1);                        % �������������
    dU = UD*(dAngU(nb:nb+nPQ-1,1));                % �����ѹ������
    
    bus(1:nPQ,2) = bus(1:nPQ,2) - dU;              % ������ѹ
    bus(1:nb-1,3) = bus(1:nb-1,3) - dAng;          % �������
    
    if (max(abs(dU))<EPS)&&(max(abs(dAng))<EPS)
        break
    end                                            % �ж��Ƿ����㾫���������������������򷵻ؼ�������
    
end

bus = PQ_(bus,Y,nPQ,nPV);                          % ����ÿ���ڵ���й����޹�ע����ӳ���

[bus,line] = ReNum_(bus,line,nodenum);             % �Խڵ�ָ���ŵ��ӳ���

YtYm = YtYm_(line);                                % ������·�ĵ�ЧYt��Ym���ӳ����Լ�����·����

bus_res = bus_res_(bus);                           % ����ڵ����ݽ�����ӳ���

S_res = S_res_(bus,line,YtYm);                     % ������·�������ӳ���

myf = fopen('Result.m','a');
fprintf(myf,'---------------ţ�٣�����ѷ������������----------\n\n �ڵ��������\n�ڵ�     �ڵ��ѹ      �ڵ���ǣ��Ƕȣ�      �ڵ�ע�빦��\n');
for i = 1:nb
    fprintf(myf,'%2.0f      ',bus_res(i,1));
    fprintf(myf,'%.6f      ',bus_res(i,2));
    fprintf(myf,'%.6f      ',bus_res(i,3));
    fprintf(myf,'%.6f + j %.6f\n',real(bus_res(i,4)),imag(bus_res(i,4)));
end
fprintf(myf,'\n��·��������\n�ڵ�I    �ڵ�J          ��·����S(I,J)               ��·����S(J,I)               ��·���dS(I,J)\n');
for i = 1:nl
    fprintf(myf,'%2.0f      ',S_res(i,1));
    fprintf(myf,'%2.0f      ',S_res(i,2));
    fprintf(myf,'%.6f + j %.6f     ',real(S_res(i,3)),imag(S_res(i,3)));
    fprintf(myf,'%.6f + j %.6f     ',real(S_res(i,4)),imag(S_res(i,4)));
    fprintf(myf,'%.6f + j %.6f\n',real(S_res(i,5)),imag(S_res(i,5)));
end
fclose(myf);                                       % ��������������ڡ�Result.m��д��ڵ����������·������  �������



%�ӳ���1  "OpDF_.m"  ����Ϊ�������ļ�

function [bus,line] = OpDF_
[dfile,pathname]=uigetfile('*.m','Select Data File');   % �����ļ�����Ϊm�ļ������ڱ���Ϊ��Select Data File��
if pathname == 0
    error(' you must select a valid data file')         % ���û��ѡ����Ч�ļ�������ִ�����ʾ
else
    lfile =length(dfile);                               % ��ȡ�ļ��ַ�������
    
    eval(dfile(1:lfile-2));                           % ȥ����׺�����ļ� ��ע�⣡���˲�����"eval"�������Զ�����"_r"��׺���˴��ĺ�������"eval"������"eval_r"����������ȥ��"_r"��׺
end    
    
    
%�ӳ���2  "Num.m"  ����Ϊ�Խڵ������򣬲��޸���Ӧ����·����

function [bus,line,nPQ,nPV,nodenum] = Num_(bus,line)
[nb,mb]=size(bus);
[nl,ml]=size(line);
nSW = 0;                   % nSWΪƽ��ڵ����
nPV = 0;                   % nPVΪPV�ڵ����
nPQ = 0;                   % nPQΪPQ�ڵ����
for i = 1:nb,              % nbΪ�ܽڵ���
    type= bus(i,6);
    if type == 3,
        nSW = nSW + 1;
        SW(nSW,:)=bus(i,:);% ���㲢����ƽ��ڵ�
    elseif type == 2,
        nPV = nPV +1;
        PV(nPV,:)=bus(i,:);% ���㲢����PV�ڵ�
    else
        nPQ = nPQ + 1;
        PQ(nPQ,:)=bus(i,:);% ���㲢����PQ�ڵ�
    end
end

bus=[PQ;PV;SW];            % ��bus����PQ��PV��ƽ��ڵ��˳����������
nodenum=[[1:nb]' bus(:,1)];% �����¾ɽڵ���ձ�

for i=1:nl
    for j=1:2
        for k=1:nb
            if line(i,j)==nodenum(k,2)
                line(i,j)=nodenum(k,1);
                break
            end
        end
    end
end                        % �������Ժ�Ľڵ�˳���line�������±��



%�ӳ���3  "y_.m"  ����Ϊ����ڵ㵼�ɾ���

function Y = y_(bus,line)

    [nb,mb]=size(bus);
    [nl,ml]=size(line);

    Y=zeros(nb,nb);                        % �Ե��ɾ��󸳳�ֵ0
    for k=1:nl
        I=line(k,1);
        J=line(k,2);
        Zt=line(k,3)+j*line(k,4);          % ������·����
        if Zt~=0
            Yt=1/Zt;                       % �ӵ�֧·������Yt
        end
        Ym=line(k,5)+j*line(k,6);
        K=line(k,7);

        if (K==0)&(J~=0)                   % ��ͨ��·: K=0
            Y(I,I)=Y(I,I)+Yt+Ym;
            Y(J,J)=Y(J,J)+Yt+Ym;
            Y(I,J)=Y(I,J)-Yt;
            Y(J,I)=Y(I,J);
        end

        if (K==0)&(J==0)                   % �Ե�֧·: K=0,J=0,R=X=0
            Y(I,I)=Y(I,I)+Ym;
        end

        if K>0                             % ��ѹ����·: Zt��YmΪ���㵽i���ֵ,K��j��
            Y(I,I)=Y(I,I)+Yt+Ym;
            Y(J,J)=Y(J,J)+Yt/K/K;
            Y(I,J)=Y(I,J)-Yt/K;
            Y(J,I)=Y(I,J);
        end

        if K<0                             % ��ѹ����·: Zt��YmΪ���㵽K���ֵ,K��i��
            Y(I,I)=Y(I,I)+Yt+Ym;
            Y(J,J)=Y(J,J)+K*K*Yt;
            Y(I,J)=Y(I,J)+K*Yt;
            Y(J,I)=Y(I,J);
        end
    end



%�ӳ���4  "dPQ_.m"  ����Ϊ���㹦��ƫ��

function [dP,dQ] =dPQ_(Y,bus,nPQ,nPV)  %  nPQ��nPVΪ��Ӧ�ڵ����

    n = nPQ + nPV +1;                      % �ܽڵ����

    dP = bus(1:n-1,4);
    dQ = bus(1:nPQ,5);                     % ��dP��dQ����ֵ  PV�ڵ㲻�����dQ ƽ��ڵ㲻�������
    for i = 1:n-1
        for j = 1:n
            dP(i,1) = dP(i,1)-bus(i,2)*bus(j,2)*(real(Y(i,j))*cos(bus(i,3)-bus(j,3))+imag(Y(i,j))*sin(bus(i,3)-bus(j,3)));
            if i<nPQ+1
                dQ(i,1) = dQ(i,1)-bus(i,2)*bus(j,2)*(real(Y(i,j))*sin(bus(i,3)-bus(j,3))-imag(Y(i,j))*cos(bus(i,3)-bus(j,3)));
            end
        end
    end                                    % ����ѭ��������ȡdP��dQ



%�ӳ���5  "Jac_.m"  ����Ϊ�����ſ˱Ⱦ���

function J = Jac_(bus,Y,nPQ)

[nb,mb]=size(bus);

H = zeros(nb-1,nb-1);
N = zeros(nb-1,nPQ);
K = zeros(nPQ,nb-1);
L = zeros(nPQ,nPQ);         % ���ſ˱Ⱦ���ֿ飬����J = [H   N; K   L]������ʼ��

Qi = zeros(nb-1,1);
Pi = zeros(nb-1,1);

for i = 1:nb-1
    for j = 1:nb
        Pi(i,1)=Pi(i,1)+bus(i,2)*bus(j,2)*(real(Y(i,j))*cos(bus(i,3)-bus(j,3))+imag(Y(i,j))*sin(bus(i,3)-bus(j,3)));
        Qi(i,1)=Qi(i,1)+bus(i,2)*bus(j,2)*(real(Y(i,j))*sin(bus(i,3)-bus(j,3))-imag(Y(i,j))*cos(bus(i,3)-bus(j,3)));
    end
end                         % ��ʼ��������Qi��Pi

for i = 1:nb-1
    for j = 1:nb-1
        if i~=j
            H(i,j)=-bus(i,2)*bus(j,2)*(real(Y(i,j))*sin(bus(i,3)-bus(j,3))-imag(Y(i,j))*cos(bus(i,3)-bus(j,3)));
        else
            H(i,j)=Qi(i,1)+imag(Y(i,j))*((bus(i,2))^2);
        end                 % �ֱ����H����ĶԽǼ��ǶԽ�Ԫ��

        if  j < nPQ+1
            if i~=j
                N(i,j)=-bus(i,2)*bus(j,2)*(real(Y(i,j))*cos(bus(i,3)-bus(j,3))+imag(Y(i,j))*sin(bus(i,3)-bus(j,3)));
            else
                N(i,j)=-Pi(i,1)-real(Y(i,j))*((bus(i,2))^2);
            end
        end                 % �ֱ����N����ĶԽǼ��ǶԽ�Ԫ��

        if  i < nPQ+1
            if i~=j
                K(i,j)=bus(i,2)*bus(j,2)*(real(Y(i,j))*cos(bus(i,3)-bus(j,3))+imag(Y(i,j))*sin(bus(i,3)-bus(j,3)));
            else
                K(i,j)=-Pi(i,1)+real(Y(i,j))*((bus(i,2))^2);
            end             % �ֱ����K����ĶԽǼ��ǶԽ�Ԫ��

            if j < nPQ+1
                if i~=j
                    L(i,j)=-bus(i,2)*bus(j,2)*(real(Y(i,j))*sin(bus(i,3)-bus(j,3))-imag(Y(i,j))*cos(bus(i,3)-bus(j,3)));
                else
                    L(i,j)=-Qi(i,1)+imag(Y(i,j))*((bus(i,2))^2);
                end
            end             % �ֱ����L����ĶԽǼ��ǶԽ�Ԫ��
        end
    end
end

J = [H   N; K   L];         % �����ſ˱Ⱦ���



%�ӳ���6  "PQ_.m"  ����Ϊ����ÿ���ڵ�Ĺ���ע��

function bus = PQ_(bus,Y,nPQ,nPV)
n = nPQ+nPV+1;        % nΪ�ܽڵ���
for i = nPQ+1:n-1
    for j = 1:n
        bus(i,5)=bus(i,5)+bus(i,2)*bus(j,2)*(real(Y(i,j))*sin(bus(i,3)-bus(j,3))-imag(Y(i,j))*cos(bus(i,3)-bus(j,3)));
    end
end                   % ���ù�ʽ����PV�ڵ���޹�ע��
for j =1:n
    bus(n,4)=bus(n,4)+bus(n,2)*bus(j,2)*(real(Y(n,j))*cos(bus(n,3)-bus(j,3))+imag(Y(n,j))*sin(bus(n,3)-bus(j,3)));
    bus(n,5)=bus(n,5)+bus(n,2)*bus(j,2)*(real(Y(n,j))*sin(bus(n,3)-bus(j,3))-imag(Y(n,j))*cos(bus(n,3)-bus(j,3)));
end                   % ����ƽ��ڵ���޹����й�ע��



%�ӳ���7  "ReNum_.m"  ����Ϊ�Խڵ����·���ݻָ����

function [bus,line] = ReNum_(bus,line,nodenum)
[nb,mb]=size(bus);
[nl,ml]=size(line);
bus_temp = zeros(nb,mb);               % bus_temp����������ʱ���bus���������
k = 1;
for i = 1 :nb
    for j = 1 : nb
        if bus(j,1) == k
            bus_temp(k,:) = bus(j,:);
            k = k + 1;
        end
    end
end                                   % ����bus��������б�����¶�bus�������򲢴���bus_temp������
bus = bus_temp;                       % ���¸�ֵ��bus�����bus��������±��

for i=1:nl
    for j=1:2
        for k=1:nb
            if line(i,j)==nodenum(k,1)
                line(i,j)=nodenum(k,2);
                break
            end
        end
    end
end                                   % �ָ�line�ı��



%�ӳ���8  "YtYm_.m"  ����Ϊ������·�ĵ�ЧYt��Ym���Լ�����·����

function YtYm = YtYm_(line)

[nl,ml]=size(line);

YtYm = zeros(nl,5);                   % ��YtYm���󸳳�ֵ0
YtYm(:,1:2) = line(:,1:2);            % ����ǰ����Ϊ��·���νڵ��ţ������зֱ�Ϊ��·��ЧYt��i��ĵ�ЧYm��j��ĵ�ЧYm
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

    if (K==0)&(J~=0)                 % ��ͨ��·: K=0
        YtYm(k,3) = Yt;
        YtYm(k,4) = Ym;
        YtYm(k,5) = Ym;
    end

    if (K==0)&(J==0)                 % �Ե�֧·: K=0,J=0,R=X=0
        YtYm(k,4) = Ym;
    end

    if K>0                           % ��ѹ����·: Zt��YmΪ���㵽i���ֵ,K��j��
        YtYm(k,3) = Yt/K;
        YtYm(k,4) = Ym+Yt*(K-1)/K;
        YtYm(k,5) = Yt*(1-K)/K/K;
    end

    if K<0                           % ��ѹ����·: Zt��YmΪ���㵽K���ֵ,K��i��
        YtYm(k,3) = -Yt*K;
        YtYm(k,4) = Ym+Yt*(1+K);
        YtYm(k,5) = Yt*(K^2+K);
    end
end



%�ӳ���9  "bus_res_.m"  ���㲢���ؽڵ����ݽ��

function bus_res = bus_res_(bus)
    [nb,mb]=size(bus);
    bus_res = zeros(nb,4);                          % bus_res���󴢴��Žڵ������
    bus_res(:,1:2) = bus(:,1:2);
    bus_res(:,3) = bus(:,3) *180 / pi;              % ��ǲ��ýǶ���
    bus_res(:,4) = bus(:,4) + (sqrt(-1))*bus(:,5);  % ע�빦��



%�ӳ���10  "S_res_.m"  ���㲢������·����

function S_res = S_res_(bus,line,YtYm)
[nl,ml]=size(line);
S_res = zeros(nl,5);             % S_res���󴢴�����·����������
S_res(:,1:2) = line(:,1:2);      % ǰ����Ϊ�ڵ���
for k=1:nl
    I = S_res(k,1);
    J = S_res(k,2);
    if (J~=0)&(I~=0)
        S_res(k,3)=bus(I,2)^2*(conj(YtYm(k,3))+conj(YtYm(k,4)))-bus(I,2)*bus(J,2)*(cos(bus(I,3))+j*sin(bus(I,3)))*(conj(cos(bus(J,3))+j*sin(bus(J,3))))*conj(YtYm(k,3));
        S_res(k,4)=bus(J,2)^2*(conj(YtYm(k,3))+conj(YtYm(k,5)))-bus(I,2)*bus(J,2)*(conj(cos(bus(I,3))+j*sin(bus(I,3))))*(cos(bus(J,3))+j*sin(bus(J,3)))*conj(YtYm(k,3));
        S_res(k,5)=S_res(k,3) + S_res(k,4);          % ���ù�ʽ����ǽӵ�֧·�ĳ���
    elseif J==0
        S_res(k,3)=bus(I,2)^2*conj(YtYm(k,4));
        S_res(k,5)=S_res(k,3)+S_res(k,4);
    else
        S_res(k,4)=bus(J,2)^2*conj(YtYm(k,5));
        S_res(k,5)=S_res(k,3)+S_res(k,4);            % ���ù�ʽ����ӵ�֧·�ĳ���
    end
end
