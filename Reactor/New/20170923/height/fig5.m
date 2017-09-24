% script for fig5
clc
clear

filename = 'fig5.xlsx';
N = 100;
p =41;

[Bo_ATC, Bo_ATS, Bo_LTC, Bo_LTB] = B_o_4direction(N);
[Br_ATC, Br_ATS, Br_LTC, Br_LTB] = B_r_4direction(N, p);

Bo = [Bo_ATC', Bo_ATS', Bo_LTC', Bo_LTB'];
Br = [Br_ATC', Br_ATS', Br_LTC', Br_LTB'];

xlswrite(filename, Bo, 1);
xlswrite(filename, Br, 2);