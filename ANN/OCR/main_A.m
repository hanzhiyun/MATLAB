%Initialization
clear;close all;clc

%Loading Data
Load_Test_Data;
Load_Train_Data;
methodA;

%hidden_nodes
hidden_layer_size = [2 5 10 20 30 60];
%numV
for i=1:6
    hidden_node = hidden_layer_size(i);

% create ANN
net = newff(Input_Train_Method_A',y,[hidden_node],...
                {'logsig' 'purelin'},'trainlm');
net = init(net);
net.trainParam.epochs = 100;
net.trainParam.show = 1; 
net.trainParam.lr = 0.05;
net.perFormFcn = 'mse';
 
%Train ANN
[net,tr1]= train(net,[Input_Train_Method_A' Input_Train_Method_A' Input_Train_Method_A' Input_Train_Method_A'],[y y y y]);
if hidden_node == 2
    Tr1 = sim(net,Input_Train_Method_A');
    figure(1)
    hold on
    plot(tr1.epoch,tr1.perf,'m')
    xlabel('literation')
    ylabel('Mean Squared Eorrs')
    title('Differnt number of neuron error-numV')
    legend('hidden_node = 2')
else if hidden_node == 5
    Tr1= sim(net,Input_Train_Method_A');
    hold on
    plot(tr1.epoch,tr1.perf,'g')
else if hidden_node ==10
    Tr1 = sim(net,Input_Train_Method_A');
    hold on
    plot(tr1.epoch,tr1.perf,'b')
else if hidden_node ==20
    Tr1 = sim(net,Input_Train_Method_A');
    hold on
    plot(tr1.epoch,tr1.perf,'y')
else if hidden_node ==30
    Tr1 = sim(net,Input_Train_Method_A');
    hold on
    plot(tr1.epoch,tr1.perf,'r')
else if hidden_node ==60
    Tr1 = sim(net,Input_Train_Method_A');
    hold on
    plot(tr1.epoch,tr1.perf,'c')
end
end
end
end
end
end
legend('hidden_node = 2','hidden_node = 5','hidden_node = 10','hidden_node = 20',...
               'hidden_node = 30','hidden_node = 60')
hold off
%simulation 
Tresult0 = sim(net,Input_Train_Method_A');

%take a threshold 0.5
Tresult0(find(Tresult0>0.5))=1;
Tresult0(find(Tresult0<0.5))=0;
fprintf('\n Tresult0:');
fprintf('\n%d %d %d %d %d %d %d %d %d %d\n',Tresult0);

end

%numV
for i=1:6
    hidden_node = hidden_layer_size(i);

% create ANN
net = newff(Input_Train_Method_A',y,[hidden_node],...
                {'logsig' 'purelin'},'trainlm');
net = init(net);
net.trainParam.epochs = 500;
net.trainParam.show = 1; 
net.trainParam.lr = 0.05;
net.perFormFcn = 'mse';
net.trainParam.min_grad = 1e-20;
 
%Train ANN
[net,tr1]= train(net,[Input_Train_Method_A' Input_Train_Method_A' Input_Train_Method_A' Input_Train_Method_A'],[y y y y]);
if hidden_node == 2
    Tr1 = sim(net,Input_test_Method_A_1');
    figure(2)
    hold on
    plot(tr1.epoch,tr1.perf,'m')
    xlabel('literation')
    ylabel('Mean Squared Eorrs')
    title('Differnt number of neuron error-numVn')
    legend('hidden_node = 2')
else if hidden_node == 5
    Tr2 = sim(net,Input_test_Method_A_1');
    hold on
    plot(tr1.epoch,tr1.perf,'g')
else if hidden_node ==10
    Tr1 = sim(net,Input_test_Method_A_1');
    hold on
    plot(tr1.epoch,tr1.perf,'b')
else if hidden_node ==20
    Tr1 = sim(net,Input_test_Method_A_1');
    hold on
    plot(tr1.epoch,tr1.perf,'y')
else if hidden_node ==30
    Tr1 = sim(net,Input_test_Method_A_1');
    hold on
    plot(tr1.epoch,tr1.perf,'r')
else if hidden_node ==60
    Tr1 = sim(net,Input_test_Method_A_1');
    hold on
    plot(tr1.epoch,tr1.perf,'c')
end
end
end
end
end
end
legend('hidden_node = 2','hidden_node = 5','hidden_node = 10','hidden_node = 20',...
               'hidden_node = 30','hidden_node = 60')
hold off

%simulation 
Tresult1 = sim(net,Input_test_Method_A_1');

%take a threshold 0.5
Tresult1(find(Tresult1>0.5))=1;
Tresult1(find(Tresult1<0.5))=0;
fprintf('\n Tresult1:');
fprintf('\n%d %d %d %d %d %d %d %d %d %d\n',Tresult1);

end

%numS
for i=1:6
    hidden_node = hidden_layer_size(i);

% create ANN
net = newff(Input_Train_Method_A',y,[hidden_node],...
                {'logsig' 'purelin'},'trainlm');
net = init(net);
net.trainParam.epochs = 100;
net.trainParam.show = 1; 
net.trainParam.lr = 0.05;
net.perFormFcn = 'mse';
 
%Train ANN
 [net,tr1]= train(net,[Input_Train_Method_A' Input_Train_Method_A' Input_Train_Method_A' Input_Train_Method_A'],[y y y y]);
if hidden_node == 2
    Tr1 = sim(net,Input_test_Method_A_2');
    figure(3)
    hold on
    plot(tr1.epoch,tr1.perf,'m')
    xlabel('literation')
    ylabel('Mean Squared Eorrs')
    title('Differnt number of neuron error-numS')
    legend('hidden_node = 2')
else if hidden_node == 5
    Tr1 = sim(net,Input_test_Method_A_2');
    hold on
    plot(tr1.epoch,tr1.perf,'g')
else if hidden_node ==10
    Tr1 = sim(net,Input_test_Method_A_2');
    hold on
    plot(tr1.epoch,tr1.perf,'b')
else if hidden_node ==20
    Tr1 = sim(net,Input_test_Method_A_2');
    hold on
    plot(tr1.epoch,tr1.perf,'y')
else if hidden_node ==30
    Tr1 = sim(net,Input_test_Method_A_2');
    hold on
    plot(tr1.epoch,tr1.perf,'r')
else if hidden_node ==60
    Tr1 = sim(net,Input_test_Method_A_2');
    hold on
    plot(tr1.epoch,tr1.perf,'c')
end
end
end
end
end
end
legend('hidden_node = 2','hidden_node = 5','hidden_node = 10','hidden_node = 20',...
               'hidden_node = 30','hidden_node = 60')
hold off
%simulation
Tresult2 = sim(net,Input_test_Method_A_2');

%   %take a threshold 0.5
Tresult2(find(Tresult2>0.5))=1;
Tresult2(find(Tresult2<0.5))=0;
fprintf('\n Tresult3:');
fprintf('\n%d %d %d %d %d %d %d %d %d %d\n',Tresult2);

end

%numSn
for i=1:6
    hidden_node = hidden_layer_size(i);

% create ANN
net = newff(Input_Train_Method_A',y,[hidden_node],...
                {'logsig' 'purelin'},'trainlm');
net = init(net);
net.trainParam.epochs = 100;
net.trainParam.show = 1; 
net.trainParam.lr = 0.05;
net.perFormFcn = 'mse';
 
%Train ANN
 [net,tr1]= train(net,[Input_Train_Method_A' Input_Train_Method_A' Input_Train_Method_A' Input_Train_Method_A'],[y y y y]);
if hidden_node == 2
    Tr1 = sim(net,Input_test_Method_A_1');
    figure(4)
    hold on
    plot(tr1.epoch,tr1.perf,'m')
    xlabel('literation')
    ylabel('Mean Squared Eorrs')
    title('Differnt number of neuron error-numSv')
    legend('hidden_node = 2')
else if hidden_node == 5
    Tr1 = sim(net,Input_test_Method_A_3');
    hold on
    plot(tr1.epoch,tr1.perf,'g')
else if hidden_node ==10
    Tr1 = sim(net,Input_test_Method_A_3');
    hold on
    plot(tr1.epoch,tr1.perf,'b')
else if hidden_node ==20
    Tr1 = sim(net,Input_test_Method_A_3');
    hold on
    plot(tr1.epoch,tr1.perf,'y')
else if hidden_node ==30
    Tr1 = sim(net,Input_test_Method_A_3');
    hold on
    plot(tr1.epoch,tr1.perf,'r')
else if hidden_node ==60
    Tr1 = sim(net,Input_test_Method_A_3');
    hold on
    plot(tr1.epoch,tr1.perf,'c')
end
end
end
end
end
end
legend('hidden_node = 2','hidden_node = 5','hidden_node = 10','hidden_node = 20',...
               'hidden_node = 30','hidden_node = 60')
hold off
%simulation
Tresult3 = sim(net,Input_test_Method_A_3');

%   %take a threshold 0.5
Tresult3(find(Tresult3>0.5))=1;
Tresult3(find(Tresult3<0.5))=0;
fprintf('\n Tresult3:');
fprintf('\n%d %d %d %d %d %d %d %d %d %d\n',Tresult3);

end
