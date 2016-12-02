function S_res = get_S(bus,line,YtYm)
%���ù�ʽ������·�����ֲ�
global rl
%-------------------------------------------------------
%S_res = [�ڵ�i �ڵ�j i�˵Ĺ��� j�˵Ĺ��� Ԫ���������]
%-------------------------------------------------------
S_res = zeros(rl,5);
S_res(:,1:2) = line(:,1:2);
U0 = bus(:,2);                  %��ѹ
th = bus(:,3);                  %���
U = U0.*(cos(th) + 1i*sin(th)); %��ѹ����
U_ = conj(U);                   %��ѹ��������
Y_ = conj(YtYm);                %YtYm�Ĺ���
for k = 1:rl
    I = S_res(k,1);
    J = S_res(k,2);
    if (I ~= 0)&&(J ~= 0)        %�ǽӵ���· 
        S_res(k,3) = U(I)^2*Y_(k,4) + U(I)*(U_(I) - U_(J))*Y_(k,3);
        S_res(k,4) = U(J)^2*Y_(k,5) + U(J)*(U_(J) - U_(I))*Y_(k,3);
        S_res(k,5) = S_res(k,3) + S_res(k,4);
    elseif J == 0               %�ӵ���·
        S_res(k,3) = U(I)^2*Y_(k,4);
        S_res(k,5) = S_res(k,3) + S_res(k,4);
    else 
        S_res(k,4) = U(J)^2*Y_(k,5);
        S_res(k,5) = S_res(k,3) + S_res(k,4);
    end
end