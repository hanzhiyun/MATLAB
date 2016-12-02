% R = [0 41 59.2 77.4 106.8 137.92 200];
% X = [0 129.7 165.2 200.8 240.1 282.1 340];
R = [0 200];
X = [0 340];
% x0 = 0.85*200/2;
axis([-100 400 -100 400]);
p = polyfit(R,X,1);
x = 0:200;
x1 = 0:300;
y = polyval(p,x);

% plot(R,X);
plot(x,y,'r-');
hold on;
plot(x1,170);
rectangle('Position',[85-167.65,144.5-167.65,167.65*2,167.65*2],'Curvature',[1,1]);
rectangle('Position',[85,144.5,2,2],'Curvature',[1,1],'FaceColor','b');
rectangle('Position',[100,170,2,2],'Curvature',[1,1],'FaceColor','r')

axis equal;
