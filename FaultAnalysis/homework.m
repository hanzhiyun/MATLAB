function homework
%输入的数据
Y = [-21.6391i  6.6138i   11.0254i
      6.6138i   -17.5759i  8.2645i
     11.0254i   8.2645i   -19.2898i];
I = [-4.3200i
     -2.8325i
     0.0000i];
z13 = 0.0907i;%13之间线路的阻抗
z23 = 0.121i; %23之间线路的阻抗
% data = importdata('Matrix_data.mat');          %导入数据
% Y = data.Y;                                 
% I = data.I;
Z = inv(Y);
[r,c] = size(Y);
Zf = Z(3,:);
I0 = I;                                  %节点注入电流的正常分量
U0 = Zf*I0;
[L,R,D] = tri_dec(Y);
disp('The matrix L is:');
disp(L);
disp('The matrix R is:');
disp(R);
disp('The matrix D is:');
disp(D);
Zk = get_Z(L,D,3);
disp('The 3th column matrix Z is:');
disp(Zk);

Zp1 = Z(3,3);
Zp2 = Z(3,3);
IF = -U0/(Zp1 + Zp2);
Ip1 = IF;
Ip2 = -IF;
Up1 = U0 + Zp1*IF;
Up2 = Up1;
disp('Each sequence network fault current:');
disp(['Ip1 = ',num2str(Ip1),'   Ip2 = ',num2str(Ip2)]);
disp(' ');
for m = 1:r
    U1(m) = Z(m,:)*I0 + Z(m,3)*Ip1;
    U2(m) = Z(m,3)*Ip2;
    disp(['The ',num2str(m),'th nodal voltage:']);
    disp(['U1 = ',num2str(U1(m)),'      U2 = ',num2str(U2(m))]);
end
disp(' ');
I13(1) = (U1(1) - U1(3))/z13;            %z13 = 0.0907i为13之间线路的阻抗
I23(1) = (U1(2) - U1(3))/z23;            %z23 = 0.121i 为23之间线路的阻抗
I13(2) = (U2(1) - U2(3))/z13;
I23(2) = (U2(2) - U2(3))/z23;
disp(['The positive-sequence current of 1-3 branch is ',num2str(I13(1))]);
disp(['The negative-sequence current of 1-3 branch is ',num2str(I13(2))]);
disp(['The positive-sequence current of 2-3 branch is ',num2str(I23(1))]);
disp(['The negative-sequence current of 2-3 branch is ',num2str(I23(2))]);