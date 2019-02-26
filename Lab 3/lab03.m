
img1 = (imread('lena_noisy.jpg'));
img2 = (imread('lena.jpg'));
% 
% 
%% Median filter
% patch_size = [3, 3];
% % patch_size = [5, 5];
batch_3 = median_filter(img1,3);
batch_5 = median_filter(img1,5);
imwrite(batch_3, 'median_3.jpg');
imwrite(batch_5, 'median_5.jpg');

%% Sobel filter
HH = [1, 2, 1; 0, 0, 0; -1, -2, -1]; % horizontal edge
HV = [1, 0, -1; 2, 0, -2; 1, 0, -1]; % vertical edge
img_sobel = sobel_filter(img2,HV,3);
imwrite(img_sobel, 'sobel_v.jpg');
img_sobel = sobel_filter(img2,HH,3);
imwrite(img_sobel, 'sobel_h.jpg');


%% Gaussian filter
hsize5 = 5; sigma5 = 2;
hsize9 = 9; sigma9 = 4;
img_gaussian = gaussian_filter(img1, hsize5, sigma5);
imwrite(img_gaussian, 'gaussian_5.jpg');
img_gaussian = gaussian_filter(img1, hsize9, sigma9);
imwrite(img_gaussian, 'gaussian_9.jpg');

