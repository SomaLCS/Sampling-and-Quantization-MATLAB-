%% Image Sampling (Sampling Rate)
clc
clear

% Setting up the image
I = imread("D:\Files\Pictures\Picture\Amos's Picture\20190508_140617.jpg"); 

% Showing the original picture
figure 
imshow(I)

% Initializing and create interpolant
F= griddedInterpolant(double(I));
[sx,sy,sz]=size(I);

% Sample frequency
SR = 1 ; % Changeable depending on the number of pixels to sample for every sample

% Scaling of the orignal image
xq=(1:SR:sx)';
yq=(1:SR:sy)';
zq= (1:sz)'; 
vq= uint8(F({xq,yq,zq})); 

figure 
imshow(vq)

%{
% Sample frequency of one sample every two pixels
xq_156=(1:312/156:sx)';
yq_156=(1:312/156:sy)';
zq= (1:sz)'; 
vq_156= uint8(F({xq_156,yq_156,zq})); 

figure 
imshow(vq_156)

% Sample frequency of one sample every four pixels
xq_78=(1:312/78:sx)'; 
yq_78=(1:312/78:sy)'; 
zq=(1:sz)'; 
vq_78= uint8(F({xq_78,yq_78,zq})); 

figure 
imshow(vq_78)

% Sample frequency of one sample every eight pixels
xq_39=(1:312/39:sx)'; 
yq_39=(1:312/39:sy)'; 
zq= (1:sz)'; 
vq_39= uint8(F({xq_39,yq_39,zq})); 

figure 
imshow(vq_39)
%}