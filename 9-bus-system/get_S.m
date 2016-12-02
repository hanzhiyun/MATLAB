function S_res = get_S(bus,line,YtYm)
%运用公式计算线路潮流分布
global rl
%-------------------------------------------------------
%S_res = [节点i 节点j i端的功率 j端的功率 元件功率损耗]
%-------------------------------------------------------
S_res = zeros(rl,5);
S_res(:,1:2) = line(:,1:2);
U0 = bus(:,2);                  %电压
th = bus(:,3);                  %相角
U = U0.*(cos(th) + 1i*sin(th)); %电压相量
U_ = conj(U);                   %电压相量共轭
Y_ = conj(YtYm);                %YtYm的共轭
for k = 1:rl
    I = S_res(k,1);
    J = S_res(k,2);
    if (I ~= 0)&&(J ~= 0)        %非接地线路 
        S_res(k,3) = U(I)^2*Y_(k,4) + U(I)*(U_(I) - U_(J))*Y_(k,3);
        S_res(k,4) = U(J)^2*Y_(k,5) + U(J)*(U_(J) - U_(I))*Y_(k,3);
        S_res(k,5) = S_res(k,3) + S_res(k,4);
    elseif J == 0               %接地线路
        S_res(k,3) = U(I)^2*Y_(k,4);
        S_res(k,5) = S_res(k,3) + S_res(k,4);
    else 
        S_res(k,4) = U(J)^2*Y_(k,5);
        S_res(k,5) = S_res(k,3) + S_res(k,4);
    end
end