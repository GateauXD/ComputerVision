
img = im2double(imread('cameraman.jpg'));

sigma = 2.0;
hsize = 7;
scale = 5;


%% Gaussian Pyramid
I = img;
kernal = fspecial('gaussian', hsize, sigma);
for s = 1:scale
    
    % Gaussian filtering
    I = imfilter(I,kernal);
    
    % Save or show image
    imwrite(I, sprintf('Gaussian_scale%d.jpg', s)); % change I to the output of Gaussian filter
    
    % Down-sampling
    I = imresize(I, 0.5);
end


%% Laplacian Pyramid
I = img;
kernal = fspecial('gaussian', hsize, sigma);
for s = 1:scale
    
    % Gaussian filtering
    gOutput = imfilter(I,kernal);
    % Laplacian filtering
    I = I - gOutput;
    % Save or show image
    imwrite(I + 0.5, sprintf('Laplacian_scale%d.jpg', s)); % change I to the output of Laplacian filter

    % Down-sampling
    I = imresize(I, 0.5);
end
