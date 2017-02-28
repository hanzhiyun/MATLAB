%% build a perceptron neural network %%
clear 
clc
x = [0 1 0 1; 0 0 1 1];
t = [0 0 0 1];
net = perceptron;
net = configure(net, x, t);
net.iw{1, 1}
net.b{1}

%% training the neural network %%
net = train(net, x, t);
net.iw{1, 1}
net.b{1}
