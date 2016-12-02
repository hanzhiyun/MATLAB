function Y = get_Y(line)
%����ڵ㵼�ɾ���
global rb rl
Y = zeros(rb,rb);   %��Y���󸳳�ʼֵ0
for k = 1:rl
    I = line(k,1);
    J = line(k,2);
    Zt = line(k,3) + 1i*line(k,4);  %������·�迹
    if Zt ~= 0
        Yt = 1/Zt;      %�ӵ���·������Yt  
    end
    Ym = line(k,5) + 1i*line(k,6);   %������·����
    K = line(k,7);          %��ѹ�����
    
    if (K == 0)&&(J ~= 0)           %��ͨ��·  
        Y(I,I) = Y(I,I) + Yt + Ym;  %�ڵ�I���Ե�����ֵ�Ͼ͵�����ýڵ���ֱ��������֧·�ĵ��ɵ��ܺ�
        Y(J,J) = Y(J,J) + Yt + Ym;
        Y(I,J) = Y(I,J) - Yt;       %�ڵ�i��j֮��Ļ�������ֵ�Ͼ͵������ӽڵ�IJ֧·���ɵĸ�ֵ
        Y(J,I) = Y(I,J);
    end
    
    if (K == 0)&&(J == 0)           %�Ե�֧·��K=0 J=0 R=X=0
        Y(I,I) = Y(I,I) + Ym;
    end
   
    if K > 0                         %��ѹ����·: Zt��YmΪ���㵽i���ֵ,K��j��
        Y(I,I) = Y(I,I) + Yt + Ym;
        Y(J,J) = Y(J,J) + Yt/K/K;
        Y(I,J) = Y(I,J) - Yt/K;
        Y(J,I) = Y(I,J);
    end
    
    if K < 0                         %��ѹ����·: Zt��YmΪ���㵽j���ֵ,K��i��
        Y(I,I) = Y(I,I) + Yt + Ym;
        Y(J,J) = Y(J,J) + Yt*K*K;
        Y(I,J) = Y(I,J) + Yt*K;
        Y(J,I) = Y(I,J);
    end
end