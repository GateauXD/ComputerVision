%Task 1Loading image 1
img1 = imread('01.jpg');
img1R = img1;
img1R(:,:,1) = 0;
imwrite(img1R, 'red.jpg');

%Task 2Load image 2
img2 = imread('02.jpg');
%Logic used for line below http://answers.opencv.org/question/57188/how-to-calculate-the-yuv-values-of-a-grayscale-image/
img2Grey = 0.299 * img2(:,:,1) + 0.587 * img2(:,:,2) + 0.114 * img2(:,:,3);
imwrite(img2Grey, 'gray.jpg');

%Task 3
img3 = imread('03.jpg');
img3Rot = imrotate(img3, 90);
imwrite(img3Rot, 'rotate.jpg');

%Task 4
img4 = imread('04.jpg');
img4Crop = imcrop(img4,[30,30,370,370]);
imwrite(img4Crop, 'crop.jpg');

%Task 5
img5 = imread('04.jpg');
img5Flip = flip(img5,1);
imwrite(img5Flip, 'flip.jpg');

%Task 6
canvas = zeros(300 * 2 + 15, 400 * 2 + 15, 3,'uint8');
canvas(1:300, 1:400,:) = img1;
canvas(1:300, 416:815,:) = img2;
canvas(316:615, 1:400,:) = img3;
canvas(316:615, 416:815,:) = img4;
imwrite(canvas, 'combine.jpg');

%Task 7
avgImage = (img4 + img5Flip);
avgImage = avgImage ./ 2;
figure;
imshow(avgImage);
imwrite(avgImage, 'average.jpg');



