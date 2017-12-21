m_proj('lambert','long',[-10 180],'lat',[-40 60]);
m_coast('patch',[1 .85 .7]);
m_elev('contourf',[500:500:6000]);
m_grid('box','fancy','tickdir','in');
colormap(flipud(copper));

[num,txt] = xlsread('cities.xlsx');
index = [9 13 3 10 11 5 6 7 4 2 8 12 1];
num = num(index,:);
txt = txt(index);
num = [num; num(1, :)];
[X,Y] = m_ll2xy(num(:, 1), num(:, 2));
line(X,Y,'marker','square','markersize',4,'color','r');
for i = 1:13
    text(X(i),Y(i),txt(i),'vertical','top');
end
