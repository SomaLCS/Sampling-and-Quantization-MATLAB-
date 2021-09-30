%% Changing Sampling Rate (Nyquist Rate)
%To read the image from file
I = imread('D:\Files\Pictures\IMG_20201225_184220.jpg');
figure

%To display the image
imshow(I), title('RGB Original Picture');

%To convert the image to grayscale
Igray = rgb2gray(I);
figure
imshow(Igray), title('Grayscale Converted Image: x=540px, y=921px');

%To extract all the details of the image & return the precision of the image
F= griddedInterpolant(double(Igray))

%The dimensions of image in terms of x,y,z 
[size_x,size_y,size_z]=size(Igray)

%To reduce the sampling rate from 540 to 270 in the x dimension 
xq_270 = (1:540/270:size_x)';

%To reduce the sampling rate from 921 to 460 in the y dimension 
yq_921 = (1:921/460:size_y)';

%To maintain the grayscale resolution of the image 
zq = (1:size_z)';

%To convert x and y into an 8 bit unsigned integer image 
vq_1 = uint8(F({xq_270,yq_921}));
figure
imshow(vq_1), title('x=270px, y=460px');


xq_135 =(1:540/135:size_x)';
yq_230 =(1:921/230:size_y)';
zq = (1:size_z)';
vq_2 = uint8(F({xq_135, yq_230}));
figure
imshow(vq_2), title('x=135px, y=230px');


xq_67 =(1:540/67:size_x)';
yq_115 =(1:921/115:size_x)';
zq = (1:size_z)';
vq_3 = uint8(F({xq_67, yq_115}));
figure
imshow(vq_3), title('x=67px, y=115px');