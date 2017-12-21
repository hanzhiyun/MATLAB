%---- Load_Test_Data  ----

%Input Digits 0-9(noise data_1)
A0Vn = imread('0numVn.bmp');
A1Vn = imread('1numVn.bmp');
A2Vn = imread('2numVn.bmp');
A3Vn = imread('3numVn.bmp');
A4Vn = imread('4numVn.bmp');
A5Vn = imread('5numVn.bmp');
A6Vn = imread('6numVn.bmp');
A7Vn = imread('7numVn.bmp');
A8Vn = imread('8numVn.bmp');
A9Vn = imread('9numVn.bmp');

   %preprocessing images__Convert the image into double(noise data_1)
E0Vn = double(A0Vn(:,:,1))/255;
E1Vn = double(A1Vn(:,:,1))/225;
E2Vn = double(A2Vn(:,:,1))/255;
E3Vn = double(A3Vn(:,:,1))/225;
E4Vn = double(A4Vn(:,:,1))/255;
E5Vn = double(A5Vn(:,:,1))/225;
E6Vn = double(A6Vn(:,:,1))/255;
E7Vn = double(A7Vn(:,:,1))/225;
E8Vn = double(A8Vn(:,:,1))/255;
E9Vn = double(A9Vn(:,:,1))/225;

    %Testing_input(noise data_1)
X1 = [E0Vn; E1Vn; E2Vn; E3Vn; E4Vn; E5Vn; E6Vn; E7Vn; E8Vn; E9Vn];

%Input Digits 0-9(noise data_2)
A0S = imread('0numS.bmp');
A1S = imread('1numS.bmp');
A2S = imread('2numS.bmp');
A3S = imread('3numS.bmp');
A4S = imread('4numS.bmp');
A5S = imread('5numS.bmp');
A6S = imread('6numS.bmp');
A7S = imread('7numS.bmp');
A8S = imread('8numS.bmp');
A9S = imread('9numS.bmp');

   %preprocessing images__Convert the image into double(noise data_2)
E0S = double(A0S(:,:,1))/255;
E1S = double(A1S(:,:,1))/225;
E2S = double(A2S(:,:,1))/255;
E3S = double(A3S(:,:,1))/225;
E4S = double(A4S(:,:,1))/255;
E5S = double(A5S(:,:,1))/225;
E6S = double(A6S(:,:,1))/255;
E7S = double(A7S(:,:,1))/225;
E8S = double(A8S(:,:,1))/255;
E9S = double(A9S(:,:,1))/225;

   %Testing_input(noise data_2)
X2 = [E0S; E1S; E2S; E3S; E4S; E5S; E6S; E7S; E8S; E9S];

%Input Digits 0-9(noise data_3)
A0Sn = imread('0numSn.bmp');
A1Sn = imread('1numSn.bmp');
A2Sn = imread('2numSn.bmp');
A3Sn = imread('3numSn.bmp');
A4Sn = imread('4numSn.bmp');
A5Sn = imread('5numSn.bmp');
A6Sn = imread('6numSn.bmp');
A7Sn = imread('7numSn.bmp');
A8Sn = imread('8numSn.bmp');
A9Sn = imread('9numSn.bmp');

%preprocessing images__Convert the image into double(noise data_3)
E0Sn = double(A0Sn(:,:,1))/255;
E1Sn = double(A1Sn(:,:,1))/225;
E2Sn = double(A2Sn(:,:,1))/255;
E3Sn = double(A3Sn(:,:,1))/225;
E4Sn = double(A4Sn(:,:,1))/255;
E5Sn = double(A5Sn(:,:,1))/225;
E6Sn = double(A6Sn(:,:,1))/255;
E7Sn = double(A7Sn(:,:,1))/225;
E8Sn = double(A8Sn(:,:,1))/255;
E9Sn = double(A9Sn(:,:,1))/225;


%Testing_input(noise data_3)
X3 = [E0Sn; E1Sn; E2Sn; E3Sn; E4Sn; E5Sn; E6Sn; E7Sn; E8Sn; E9Sn];