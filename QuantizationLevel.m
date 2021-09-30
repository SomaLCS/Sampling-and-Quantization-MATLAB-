%% Quantization Level(Plots)

% Image reading
x = double((imread("D:\Files\Pictures\IMG_20201225_183906.jpg")));

% Size of an image
[height, width, colour] = size(x); 

% Brightness level (Gray level intensity of image)
B = 6;

% Quantized to L levels
L = 300; % Changeable to notice the difference of different quantization level
q = B / L;

%Quantizer characteristics 
Q = zeros(256, 1); 
for i = 0:255 
    Q(i+1, 1) = floor(i / q) *q + q ; 
end

%Output image intitialization 
y = zeros(size(x)); 
for ch = 1:colour 
    for i = 1:height, 
        for j = 1:width, 
            y(i, j,ch) = Q(x(i,j,ch) + 1);
        end
    end
end

% Quantizer plot 
figure; 
plot(0:255,Q)

%Quantized image 
figure; 
imagesc(uint8(y));