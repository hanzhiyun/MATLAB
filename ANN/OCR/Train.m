clc;clear;
[SEG0, SEG1] = method_A();

input_train = repmat(SEG0, 1, 4);
input_test = SEG1;
output_train = [1;2;3;4;5;6;7;8;9;10];

[inputn,inputps] = mapminmax(input_train);

%构造输出矩阵
s = length( output_train) ;
output = zeros( s , 10  ) ;
for i = 1 : s 
   output( i , output_train( i ) ) = 1 ;
end
output = repmat(output, 1, 4);
% [outputn,outputps] = mapminmax(output, 0, 1);
%创建神经网络
% net = feedforwardnet(20) ;
% net = init(net);
% net=newff(input_train,output,20);

%设置训练参数
% net.trainparam.show = 50 ;
% net.trainparam.epochs = 2000 ; %训练次数
% net.trainparam.goal = 1e-10 ;%设置训练误差值 
% net.trainParam.lr = 0.05 ;


net = newff(inputn,output,[10],...
                {'logsig' 'purelin'},'trainlm');
net = init(net);
net.trainParam.epochs = 500;
net.trainParam.show = 1; 
net.trainParam.lr = 0.05;
net.perFormFcn = 'mse';
net.trainParam.min_grad = 1e-20;


%开始训练
[net,tr1] = train( net, inputn, output ) ;


%测试数据归一化
testInput = mapminmax ( 'apply', input_test, inputps) ;

%仿真
Y = sim( net , testInput ) 
Y(find(Y>0.5))=1;
Y(find(Y<0.5))=0
% Y = mapminmax('reverse', Y, outputps)

plot(tr1.epoch,tr1.perf,'g')

% 统计识别正确率
[s1 , s2] = size( Y ) ;
hitNum = 0 ;
for i = 1 : s2
    [m , Index] = max( Y( : ,  i ) ) ;
    if( Index  == output_train(i) ) 
        hitNum = hitNum + 1 ; 
    end
end
sprintf('识别率是 %3.3f%%',100 * hitNum / s2 )
