function I_res = get_I(bus,S_res)
%-------------------------------------------------------
%I_res = [�ڵ�i �ڵ�j i�˵ĵ��� j�˵ĵ���]
%-------------------------------------------------------
global rl
I_res = zeros(rl,4);
I_res(:,1:2) = S_res(:,1:2);
U0 = bus(:,2);                  %��ѹ
th = bus(:,3);                  %���
U = U0.*(cos(th) + 1i*sin(th)); %��ѹ����
for k = 1:rl
    I = I_res(k,1);
    J = I_res(k,2);
    I_res(k,3) = conj(S_res(k,3)/U(I));
    I_res(k,4) = conj(S_res(k,4)/U(J));
end  
        