function YtYm = get_YtYm(line)
global rl
YtYm = zeros(rl,5);          % ��YtYm���󸳳�ֵ0
YtYm(:,1:2) = line(:,1:2);   % ����ǰ����Ϊ��·���νڵ��ţ������зֱ�Ϊ��·��ЧYt��i��ĵ�ЧYm��j��ĵ�ЧYm
for k = 1:rl
    J = line(k,2);
    Zt = line(k,3) + 1i*line(k,4);
    if Zt ~= 0
        Yt = 1/Zt;
    end
    Ym = line(k,5) + 1i*line(k,6);
    K = line(k,7);
    
    if (K == 0)&&(J ~= 0)               % ��ͨ��·: K=0
        YtYm(k,3) = Yt;
        YtYm(k,4) = Ym;
        YtYm(k,5) = Ym;
    end

    if (K==0)&&(J==0)                   % �Ե�֧·: K=0,J=0,R=X=0
        YtYm(k,4) = Ym;
    end

    if K>0                              % ��ѹ����·: Zt��YmΪ���㵽i���ֵ,K��j��
        YtYm(k,3) = Yt/K;
        YtYm(k,4) = Ym + Yt*(K - 1)/K;
        YtYm(k,5) = Yt*(1 - K)/K/K;
    end

    if K<0                           % ��ѹ����·: Zt��YmΪ���㵽j���ֵ,K��i��
        YtYm(k,3) = -Yt*K;
        YtYm(k,4) = Ym + Yt*(1 + K);
        YtYm(k,5) = Yt*(K^2 + K);
    end
end
