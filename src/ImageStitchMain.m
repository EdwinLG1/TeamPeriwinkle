%% Setup
%Assuming input is normalized, preprocessed images
path1 = importdata('image1.txt');
disp(class(path1{1}));
disp(path1{1});
path2 = importdata('image2.txt');
disp(class(path2{1}));
disp(path2{1});

image1 = imread(convertCharsToStrings(path1(1)));
image2 = imread(convertCharsToStrings(path2(1)));

image1 = imrotate(image1,270);
image2 = imrotate(image2,270);

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
w1 = size(image1, 2);
h1 = size(image1, 1);

w2 = size(image2, 2);
h2 = size(image2, 1);

%% Initializing/Filling New Stitching Array
%Making Empty Array for 
distance = 256;
bigger_height = 0;
other_height = 0;

if h1 >= h2
    bigger_height = h1;
    other_height = h2;
else 
    bigger_height = h2;
    other_height = h1;
end

%%
w3 = w1 + w2 + distance;
h3 = bigger_height;
start_point_w2 = w1+distance;
stitched_image = uint8(zeros(h3, w3, 3));
mask = double(ones(h3,w3));
A = double(zeros(h3,w3));

if h1 == bigger_height
    stitched_image(:,1:w1,:) = image1(:,:,:);
    mask(:,1:w1) = 0;
    A(:,1:w1) = 1;
    for i=1:w2
        stitched_image(1:h2,i+w1+distance,:) = image2(:,i,:);
        mask(1:h2, i+w1+distance) = 0;
        A(1:h2, i+w1+distance) = 1;
    end

else
    stitched_image(1:h1,1:w1,:) = image1(:,:,:);
    mask(1:h1,1:w1) = 0;
    A(1:h1, 1:w1) = 1;
    for i=1:w2
        stitched_image(:,i+w1+distance,:) = image2(:,i,:);
        mask(:,i+w1+distance) = 0;
        A(:,i+w1+distance) = 1;
    end
end

%%

figure(3),
imshow(stitched_image);
imwrite(stitched_image, 'Stitched_Image.png', 'Alpha', A);

figure(4),
imshow(mask);
imwrite(mask, 'Mask.png', 'png');

%%
img = imread("Stitched_Image.png");

figure(5),
imshow(img);
























