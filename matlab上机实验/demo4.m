%�����й��޹���
P=input('�������й����ʣ�');
Q=input('�������޹����ʣ�');
%���õ���������
deltaP=1;
deltaQ=1;
%���õ�ѹ��λ��ֵ��
U=1;
Sita=1;

%������ֹ��while�е����⣬��for�滻
Uline=1;
Sitaline=1;

E = 1;
X = 0.08;
%����ѭ����
for i = 1:1000 
    deltaP=P+E/X*U*sin(Sita);
    deltaQ=Q+E/X*U^2-1/X*U*cos(Sita);
    %�����ſɱȾ���
    B1=-E/X*sin(Sita);
    B2=-E/X*U*cos(Sita);
    B3=-E/X*U+1/X*cos(Sita);
    B4=-1/X*U*sin(Sita);
    %�ſɱȾ���
    B=[B1 B2;B3 B4];
    %����������
    delta=B\[deltaP;deltaQ];
    %������ѹ��ֵ����ǣ�
    U=U+delta(1,1);
    Sita=Sita+delta(2,1);
    %��ֹ�������£�
    Uline=abs(delta(1,1));
    Sitaline=abs(delta(2,1));
    %��������������ֹ��
    if ((Uline<0.001)&&(Sitaline<0.001))
        break;
    end
    if i == 1000
        msgbox('����Ĳ���ʹ�ü�������������');
    end
end
%��������
disp('��ѹ��ֵΪ');
disp(U);
disp('��ѹ���Ϊ');
disp(rad2deg(Sita));