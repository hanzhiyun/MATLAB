%ţ�ٵ�����

%���е�������
function Plot_Newton()
for a = -1:0.01:(1 - 0.01)
    for b = -1:0.01:(1 - 0.01)
        X = a + b*1i;
        q = 0;                      %������������
        while q <= 100              %��������
            x0 = X - f(X)/h(X);     %ţ�ٵ�����ʽ
            if abs(x0 - X) > 0.0001;  %�����ж�
                X = x0;
            else break
            end
            q = q + 1;
        end
        %         x0 = 0;
        %         while abs(X - x0) > 0.00001         %�����ж�
        %             x0 = X - f(X)/h(X);              %ţ�ٵ�����ʽ
        %             X = x0;
        %         end
        judge = min(min(min(abs(X - 1),abs(X - (-1))),abs(X - 1i)),abs(X - (-1i)));
        switch (judge)
            case abs(X - 1)
                rectangle('Position',[a,b,0.01,0.01],'FaceColor','r','edgecolor','r')
            case abs(X - (-1))
                rectangle('Position',[a,b,0.01,0.01],'FaceColor','y','edgecolor','y')
            case abs(X - 1i)
                rectangle('Position',[a,b,0.01,0.01],'FaceColor','b','edgecolor','b')
            case abs(X - (-1i))
                rectangle('Position',[a,b,0.01,0.01],'FaceColor','g','edgecolor','g')
        end
        %         fprintf('\n%s%.4f\t%s%d','X=',X) %������
    end
end


%�����ı��ʽ
function y = f(x)
y = x^4 - 1;  %����f(x)�ı��ʽ

function z = h(x)
z = 4*x^3;%����h(x���ı��ʽ
