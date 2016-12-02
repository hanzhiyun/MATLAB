X=[0;1];
T=0.0001;
for m=1:10
    fP=10*X(2)*sin(X(1))+2;
    fQ=-10*X(2)*cos(X(1))+10*X(2)^2+1;
    if fP< T && fQ<T
        V=X(2)
        th=X(1)*180/pi
        break;
    end
    dfP1=10*X(2)*cos(X(1));
    dfP2=10*sin(X(1));
    dfQ1=10*X(2)*sin(X(1));
    dfQ2=-10*cos(X(1))+20*X(2);
    J=[dfP1,dfP2;dfQ1,dfQ2];
    dx=-inv(J)*[fP;fQ];
    X=X+dx;
end
