function YtYm = get_YtYm(line)
global rl
YtYm = zeros(rl,5);          % 对YtYm矩阵赋初值0
YtYm(:,1:2) = line(:,1:2);   % 矩阵前两列为线路两段节点编号，后三列分别为线路等效Yt，i侧的等效Ym，j侧的等效Ym
for k = 1:rl
    J = line(k,2);
    Zt = line(k,3) + 1i*line(k,4);
    if Zt ~= 0
        Yt = 1/Zt;
    end
    Ym = line(k,5) + 1i*line(k,6);
    K = line(k,7);
    
    if (K == 0)&&(J ~= 0)               % 普通线路: K=0
        YtYm(k,3) = Yt;
        YtYm(k,4) = Ym;
        YtYm(k,5) = Ym;
    end

    if (K==0)&&(J==0)                   % 对地支路: K=0,J=0,R=X=0
        YtYm(k,4) = Ym;
    end

    if K>0                              % 变压器线路: Zt和Ym为折算到i侧的值,K在j侧
        YtYm(k,3) = Yt/K;
        YtYm(k,4) = Ym + Yt*(K - 1)/K;
        YtYm(k,5) = Yt*(1 - K)/K/K;
    end

    if K<0                           % 变压器线路: Zt和Ym为折算到j侧的值,K在i侧
        YtYm(k,3) = -Yt*K;
        YtYm(k,4) = Ym + Yt*(1 + K);
        YtYm(k,5) = Yt*(K^2 + K);
    end
end
