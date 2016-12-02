clc;clear;
open demo2;
k = 0;
for i = 0:20:80
    k = k + 1;
    set_param('demo2/Sine Wave','Amplitude','i');
    options = simset('SrcWorkspace','current');
    stop_time = 0.1;
    sim('demo2',stop_time,options);
    h = plot(tout,simout);
    hold on;
    switch(k)
        case 1
            set(h,'color','r');
        case 2
            set(h,'color','g');
        case 3
            set(h,'color','b');
        case 4
            set(h,'color','k');
        case 5
            set(h,'color','y');
    end
end
xlabel('时间/t');
ylabel('电压/U')
legend('谐波幅值为0','谐波幅值为20','谐波幅值为40','谐波幅值为60','谐波幅值为80');
