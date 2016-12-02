function I_res = get_I(bus,S_res)
%-------------------------------------------------------
%I_res = [节点i 节点j i端的电流 j端的电流]
%-------------------------------------------------------
global rl
I_res = zeros(rl,4);
I_res(:,1:2) = S_res(:,1:2);
U0 = bus(:,2);                  %电压
th = bus(:,3);                  %相角
U = U0.*(cos(th) + 1i*sin(th)); %电压相量
for k = 1:rl
    I = I_res(k,1);
    J = I_res(k,2);
    I_res(k,3) = conj(S_res(k,3)/U(I));
    I_res(k,4) = conj(S_res(k,4)/U(J));
end  
        