img = imread("testImage.png");

figure(1),
imshow(img);

%Make distance a multiple of 8 for following code to work
[M,N] = size(img,[1 2]);
distance = 256;

% make sure N/2 is an even number
if mod(N,2) == 1
    distance = distance + 1;
end

width = uint32(((N-distance)/2));

img1 = uint8(zeros(M, width, 3));
img2 = uint8(zeros(M, width, 3));


img1(:, :, :) = img(:,1:width,:);
for i = 1:width
    img2(:, i, :) = img(:, i+width+distance, :);
end

figure(2),
imshow(img1);
imwrite(img1, 'image1.jpg');

figure(3),
imshow(img2);
imwrite(img2, 'image2.jpg');
