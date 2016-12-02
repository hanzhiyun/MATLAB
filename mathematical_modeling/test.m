clear; 
clc; 
P = [1, 0, 4];
origin = [0, 0, 0];
direct = [0, 0, 1];
theta = deg2rad(90);
Pr = rot3d(P,origin,direct,theta)