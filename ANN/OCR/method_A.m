function [SEG0, SEG1] = method_A()

% addpath E:\Hanzhiyun\Matlab\ANN\OCR\numV;
for i = 0:9
    imagename = [num2str(i), 'numV.bmp'];
    A{i+1} = imread(imagename);
    E{i+1} = double(A{i+1}(:, :, 1))/255;
    SEG0(:,i+1) = get_seg(E{i+1});
end

for i = 0:9
    imagename1 = [num2str(i), 'numVn.bmp'];
    A1{i+1} = imread(imagename1);
    E1{i+1} = double(A1{i+1}(:, :, 1))/255;
    SEG1(:,i+1) = get_seg(E1{i+1});
end


% A0 = imread('0numV.bmp');
% A1 = imread('1numV.bmp');
% A2 = imread('2numV.bmp');
% A3 = imread('3numV.bmp');
% A4 = imread('4numV.bmp');
% A5 = imread('5numV.bmp');
% A6 = imread('6numV.bmp');
% A7 = imread('7numV.bmp');
% A8 = imread('8numV.bmp');
% A9 = imread('9numV.bmp');


% E0 = double(A0(:, :, 1))/255;
% E1 = double(A1(:, :, 1))/255;
% E2 = double(A2(:, :, 1))/255;
% E3 = double(A3(:, :, 1))/255;
% E4 = double(A4(:, :, 1))/255;
% E5 = double(A5(:, :, 1))/255;
% E6 = double(A6(:, :, 1))/255;
% E7 = double(A7(:, :, 1))/255;
% E8 = double(A8(:, :, 1))/255;
% E9 = double(A9(:, :, 1))/255;

% SEG0 = get_seg(E0);
% SEG1 = get_seg(E1);
% SEG2 = get_seg(E2);
% SEG3 = get_seg(E3);
% SEG4 = get_seg(E4);
% SEG5 = get_seg(E5);
% SEG6 = get_seg(E6);
% SEG7 = get_seg(E7);
% SEG8 = get_seg(E8);
% SEG9 = get_seg(E9);
% 
% SEG = [SEG0; SEG1; SEG2; SEG3; SEG4; SEG5; SEG6; SEG7; SEG8; SEG9]';



function seg = get_seg(E)
seg1 = sum(sum(E(1:2, 2:9)))/16;
seg2 = sum(sum(E(10:11, 2:9)))/16;
seg3 = sum(sum(E(19:20, 2:9)))/16;

seg4 = sum(sum(E(2:9, 1:3)))/24;
seg5 = sum(sum(E(2:9, 8:10)))/24;

seg6 = sum(sum(E(11:19, 1:3)))/27;
seg7 = sum(sum(E(11:19, 8:10)))/27;

seg = [seg1, seg2, seg3, seg4, seg5, seg6, seg7]';
