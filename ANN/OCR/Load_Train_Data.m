%---- Load_Train_Data----

%Input Digits 0-9
A0 = imread('0numV.bmp');
A1 = imread('1numV.bmp');
A2 = imread('2numV.bmp');
A3 = imread('3numV.bmp');
A4 = imread('4numV.bmp');
A5 = imread('5numV.bmp');
A6 = imread('6numV.bmp');
A7 = imread('7numV.bmp');
A8 = imread('8numV.bmp');
A9 = imread('9numV.bmp');

%preprocessing images__Convert the image into double
E0 = double(A0(:,:,1))/255;
E1 = double(A1(:,:,1))/225;
E2 = double(A2(:,:,1))/255;
E3 = double(A3(:,:,1))/225;
E4 = double(A4(:,:,1))/255;
E5 = double(A5(:,:,1))/225;
E6 = double(A6(:,:,1))/255;
E7 = double(A7(:,:,1))/225;
E8 = double(A8(:,:,1))/255;
E9 = double(A9(:,:,1))/225;

%Desired Output
B0=[1 0 0 0 0 0 0 0 0 0];
B1=[0 1 0 0 0 0 0 0 0 0];
B2=[0 0 1 0 0 0 0 0 0 0];
B3=[0 0 0 1 0 0 0 0 0 0];
B4=[0 0 0 0 1 0 0 0 0 0];
B5=[0 0 0 0 0 1 0 0 0 0];
B6=[0 0 0 0 0 0 1 0 0 0];
B7=[0 0 0 0 0 0 0 1 0 0];
B8=[0 0 0 0 0 0 0 0 1 0];
B9=[0 0 0 0 0 0 0 0 0 1];

y = [B0 ; B1; B2; B3; B4; B5; B6; B7; B8; B9];

