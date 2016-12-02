function p = satellite2earth(r)
R = 6371e3;
if length(r) == 3
    r_dis = norm(r);
    p = [R * r(1) / r_dis, R * r(2) / r_dis, R * r(3) / r_dis];
else
    disp('Warning:The dimension of R is not enough!');
    p = zeros(length(r));
end