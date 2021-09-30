%%Quantization.m: Changing bit size
%To read and display image
I=imread('D:\Files\Pictures\IMG_20201225_184220.jpg');
figure
imshow(I), title('RGB Original Image');

%To convert the image to grayscale
Igray = rgb2gray(I);
figure
imshow(Igray), title('Grayscale Converted Image');

%Using [X, map] = gray2ind(I,n)
[Igray16, map16] = gray2ind(Igray,16); %converts 8bpp to 4bpp
[Igray4, map4] = gray2ind(Igray,4); %converts 8bpp to 2bpp
[Igray2, map2] = gray2ind(Igray,2); %converts 8bpp to 1bpp
figure
imshow(Igray16, map16), title('Grayscale 4-bit Image');
figure
imshow(Igray4, map4), title('Grayscale 2-bit Image');
figure
imshow(Igray2, map2), title('Grayscale 1-bit Image');