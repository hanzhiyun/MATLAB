function main 


p1 = 120;
p2 = 8;

[Bo_ATC1, Bo_ATS1, Bo_LTC1, Bo_LTB1] = B_o_4direction(p1);
[Bo_ATC2, Bo_ATS2, Bo_LTC2, Bo_LTB2] = B_o_4direction(p2);

[~, n] = size(Bo_ATC1);

figure(1);
d = 1:n;
plot(d, Bo_ATC1, d, Bo_ATC2);
legend('B_{ATC1}', 'B_{ATC2}');

figure(2);
d = 1:n;
plot(d, Bo_ATS1, d, Bo_ATS2);
legend('B_{ATS1}', 'B_{ATS2}');

figure(3);
d = 1:n;
plot(d, Bo_LTC1, d, Bo_LTC2);
legend('B_{LTC1}', 'B_{LTC2}');

figure(4);
d = 1:n;
plot(d, Bo_LTB1, d, Bo_LTB2);
legend('B_{LTB1}', 'B_{LTB2}');
