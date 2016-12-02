function get_initial
%首先假定经度0和X轴重合，求解对应情况下的轨道曲线
R = 6371393;%地球半径/m
dis = 1667e3;
origin = [0, 0, 0];

ob_lat = deg2rad(32.0209);
ob_lon = deg2rad(118.7681);
ob_x = R * cos(ob_lat) * cos(ob_lon);
ob_y = R * cos(ob_lat) * sin(ob_lon);
ob_z = R * sin(ob_lat);
ob = [ob_x, ob_y, ob_z];
% disp(ob);
nor = [-ob_x, -ob_y, (ob_x^2 + ob_y^2) / ob_z]; %在地球观测点切平面上的正北方

d_azi = deg2rad(183.7);%方位角
d_ele = deg2rad(10.1);%仰角
%rot3d使用的角度是遵循右手定则旋转的
d = rot3d(nor, origin, ob, 2*pi - d_azi);
% disp(ob * d');
p_temp_A = [d(1), d(2); ob(1), ob(2)];
p_temp_B = [d(3); ob(3)];
p_temp_X = p_temp_A\p_temp_B; %求解出一个d和ob所在平面的反向量
p_temp = [p_temp_X(1), p_temp_X(2), -1];%直接取z的值为-1

d = rot3d(d, origin, p_temp, 2*pi - d_ele);
d = dis* d / norm(d);
s = ob + d;
% norm(s)

i = deg2rad(97.418);%倾斜角 以下单位角度均转换为弧度
OMEGA = deg2rad(318.063);%升交点赤经 
e = 0.0002;%偏心率
omega = deg2rad(36.122);%近地点幅角
a = 6866e3;
b = 6866e3;
A = [cos(omega)*cos(OMEGA) - sin(omega)*cos(OMEGA)*cos(i), sin(omega)*sin(OMEGA) - sin(omega)*cos(OMEGA)*cos(i), sin(omega)*sin(i)];
B = [-sin(omega)*cos(OMEGA) - cos(omega)*sin(OMEGA)*cos(i), -sin(omega)*sin(OMEGA) + cos(omega)*cos(OMEGA)*cos(i), cos(omega)*sin(i)];
% Rs = a*(cos(E) - e)*A + b*sin(E)*B;

% A = [cos(omega)*cos(OMEGA) - sin(omega)*cos(OMEGA)*cos(i), cos(omega)*sin(OMEGA) - sin(omega)*cos(OMEGA)*cos(i), sin(omega)*sin(i)];
% B = [-sin(omega)*cos(OMEGA) - cos(omega)*sin(OMEGA)*cos(i), -sin(omega)*sin(OMEGA) + cos(omega)*cos(OMEGA)*cos(i), cos(omega)*sin(i)];

eqn3 = @(E) a*(cos(E) - e)*A(3) + b*sin(E)*B(3) - s(3);

%disp(s);
%在此我们知道应该有两个解
s_cnt = 1;
for k = -pi:pi/6:pi
    sol = fsolve(eqn3, k);
    if sol <= pi && sol > -pi
        if 1 == s_cnt
            solE(1) = sol;
            s_cnt = 2;
        elseif 2 == s_cnt && (fix(sol*1e4) ~= fix(solE(1)*1e4))%MATLAB中小数由于精度问题并不能直接比较，在此处保留其小数点后四位
            solE(2) = sol;
            break;
        end
    end
end
% disp(solE);    

%带入解判断哪个里观测点较近，使用和前面推导出来的卫星点s的距离作为判别条件
S_temp_x = a*(cos(solE) - e)*A(1) + b*sin(solE)*B(1);
S_temp_y = a*(cos(solE) - e)*A(2) + b*sin(solE)*B(2);
S_temp_z = a*(cos(solE) - e)*A(3) + b*sin(solE)*B(3);

% disp(s(3));
S_t = [S_temp_x',S_temp_y',S_temp_z'];

% disp([norm(S_t(1,:)), norm(S_t(2,:))]);
% disp([S_t(1,1)^2 + S_t(1,2)^2 + S_t(1,3)^2, S_t(2,1)^2 + S_t(2,2)^2 + S_t(2,3)^2]);

Dis = S_t - repmat(s, 2, 1);
if norm(Dis(1,:)) <= norm(Dis(2,:))
    S = S_t(1,:);
else
    S = S_t(2,:);
end
% disp(S_t);
% disp(s);
% disp(S);

s_th = atan2(s(2), s(1));
S_th = atan2(S(2), S(1));
% disp([rad2deg(s_th), rad2deg(S_th)]);
dOmega = S_th - s_th;
disp(rad2deg(dOmega));

% temp_x = s(1)*cos(dOmega) + s(2)*sin(dOmega)
% temp_y = s(2)*cos(dOmega) - s(1)*sin(dOmega)
% disp(S);
% disp([norm(S), norm(s)]);












