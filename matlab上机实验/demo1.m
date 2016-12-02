function demo1(x)
%x为用户定义的输入数字的个数
sum = 0;
for i = 1:x + 1
    if i == x + 1
        fprintf('\n输入的数字个数已经达到了参数的个数%d\n',x);
        break;
    end
    y(i) = input('plesse input one number:');
    if y > 0 
        fprintf('\n%d大于零！\n',y(i));
    else
        fprintf('\n%d不大于零！\n',y(i));
    end
    fprintf('\n已经输入了%d个数了！\n',i);
    sum = sum + y(i);
    
    
end
avgy = sum/x;
miny = min(y);
maxy = max(y);
fprintf('\n平均值为：%d\n',avgy);
fprintf('\n最大值为：%d\n',maxy);
fprintf('\n最小值为：%d\n',miny);