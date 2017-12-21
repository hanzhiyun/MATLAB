function shortest
N = 100;
sum = 0;
for i = 1:N
    m = main3;
    if i == 1
        mbest = m;
    else
        if mbest > m
            mbest = m;
        end
    end
    if (abs(m - 40.2) < 0.01)
        sum = sum + 1;
    end
end
disp(['The shortest distance is ', num2str(mbest)]);
disp(['The correct rate of this way is ', num2str(100*sum/N), '%']);