%% Setup
%Assuming input is normalized, preprocessed images
image1 = imread("octo256.jpg");
image2 = imread("Kirby.png");

figure(1),
imshow(image1);
figure(2),
imshow(image2);

%RGB vectors for each image
r1 = image1(:,:,1);
g1 = image1(:,:,2);
b1 = image1(:,:,3);

r2 = image2(:,:,1);
g2 = image2(:,:,2);
b2 = image2(:,:,3);

%Finding dimensions of images
w1 = size(image1, 1);
h1 = size(image1, 2);

w2 = size(image2, 1);
h2 = size(image2, 2);

%% Initializing/Filling New Stitching Array
%Making Empty Array for 
distance = 256;
bigger_width = 0;
bigger_height = 0;

if w1 >= w2
    bigger_width = w1;
else 
    bigger_width = w2;
end

if h1 >= h2
    bigger_height = h1;
else 
    bigger_height = h2;
end

w3 = 2 * bigger_width + distance;
h3 = bigger_height;
start_point_w2 = w1+distance;
im2double(image1)
stitched_image = zeros(h3, w3, 3);


if h1 == bigger_height
    stitched_image(:,1:w1,:) = image1(:,:,:);
    
    for i=1:w2
        stitched_image(1:h2,i+w1+distance,:) = image2(:,i,:);
    end

else
    stitched_image(1:h1,1:w1,:) = image1(:,:,:);
    
    for i=1:w2
        stitched_image(:,i+w1+distance,:) = image2(:,i,:);
    end
end



figure(3),
imshow(stitched_image)
%stitched_image(0:Height_px_img1,0:Width_px_img1,:) = im2double(image1);
% stitched_image(end-Height_px_img2:end,end-Width_px_img2:end,:) = im2double(image2)






























