Q = 0.2; 
i = 0;
for P = 0:0.1:1000000
    i = i + 1;
    [U(i) f] = flow(P,Q);
    if f == 15
        break;
    end
end
plot(P,U);