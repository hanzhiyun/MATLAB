%ţ�ٵ�����

%���е�������
function Plot_Newton2()
for a = -2:0.01:2
    for b = -2:0.01:2
        X = a + b*1i;
        x0 = 0;
        while abs(X - x0) > 0.0001         %�����ж�
            x0 = X - f(X)/h(X);              %ţ�ٵ�����ʽ        
            X = x0;
        end
        judge = min(min(abs(X - 1),abs(X - ((3^(1/2)*1i)/2 - 1/2))),abs(X - (- (3^(1/2)*1i)/2 - 1/2)));
        switch (judge)
            case abs(X - 1) 
            rectangle('Position',[a,b,0.01,0.01],'FaceColor','r','edgecolor','r')
            case abs(X - ((3^(1/2)*1i)/2 - 1/2)) 
            rectangle('Position',[a,b,0.01,0.01],'FaceColor','b','edgecolor','b')
            case abs(X - (- (3^(1/2)*1i)/2 - 1/2)) 
            rectangle('Position',[a,b,0.01,0.01],'FaceColor','g','edgecolor','g')
        end
%         fprintf('\n%s%.4f\t%s%d','X=',X) %������
    end
end


%�����ı��ʽ
function y = f(x)
y = x^3 - 1;  %����f(x)�ı��ʽ

function z = h(x)
z = 3*x^2;%����h(x���ı��ʽ
