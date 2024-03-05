picture = imread('kirby.png');

figure(1),
imshow(picture);
%% Getting RGB Arrays
R = picture(:,:,1);
G = picture(:,:,2);
B = picture(:,:,3);

%% 
dim = size(R);
lum = zeros(dim(1), dim(2)); %initialize empty luminance array
%% Finding Luminence
x = 0;
for i = 1:dim(1)
    %disp('hi');
   
    for y = 1:dim(2)
        lum(i,y) = 0.299 .* R(i,y) + 0.587 .* G(i,y) + .114 .* B(i,y); %perceived luminance
    end
end
        
%% Finding Contrast using RMS methodology 

avg_lum = mean(lum, "all");
lum_norm = lum / 255; % normalizing average for calculation
avg_lum_norm = avg_lum / 255; %normalizing for difference array
lum_diff = zeros(dim(1), dim(2)); %initializing difference array

for i = 1:dim(1)
    %disp('hi');
   
    for y = 1:dim(2)
        lum_diff(i,y) = (lum_norm(i,y) - avg_lum_norm).^2; %difference of luminance - calculating std
    end
end

rms_contrast = mean(lum_diff, "all");

%%
n = 1;  
Idouble = im2double(picture); 
avg = mean2(Idouble);
% sigma = std2(Idouble);

J = imadjust(picture,[avg-n*rms_contrast avg+n*rms_contrast],[]);

figure(2),
imshow(J);