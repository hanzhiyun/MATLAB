function Y = get_Y(line)
%计算节点导纳矩阵
global rb rl
Y = zeros(rb,rb);   %给Y矩阵赋初始值0
for k = 1:rl
    I = line(k,1);
    J = line(k,2);
    Zt = line(k,3) + 1i*line(k,4);  %读入线路阻抗
    if Zt ~= 0
        Yt = 1/Zt;      %接地线路不计算Yt  
    end
    Ym = line(k,5) + 1i*line(k,6);   %读入线路导纳
    K = line(k,7);          %变压器变比
    
    if (K == 0)&&(J ~= 0)           %普通线路  
        Y(I,I) = Y(I,I) + Yt + Ym;  %节点I的自导纳数值上就等于与该节点上直连的所有支路的导纳的总和
        Y(J,J) = Y(J,J) + Yt + Ym;
        Y(I,J) = Y(I,J) - Yt;       %节点i，j之间的互导纳数值上就等于连接节点IJ支路导纳的负值
        Y(J,I) = Y(I,J);
    end
    
    if (K == 0)&&(J == 0)           %对地支路：K=0 J=0 R=X=0
        Y(I,I) = Y(I,I) + Ym;
    end
   
    if K > 0                         %变压器线路: Zt和Ym为折算到i侧的值,K在j侧
        Y(I,I) = Y(I,I) + Yt + Ym;
        Y(J,J) = Y(J,J) + Yt/K/K;
        Y(I,J) = Y(I,J) - Yt/K;
        Y(J,I) = Y(I,J);
    end
    
    if K < 0                         %变压器线路: Zt和Ym为折算到j侧的值,K在i侧
        Y(I,I) = Y(I,I) + Yt + Ym;
        Y(J,J) = Y(J,J) + Yt*K*K;
        Y(I,J) = Y(I,J) + Yt*K;
        Y(J,I) = Y(I,J);
    end
end