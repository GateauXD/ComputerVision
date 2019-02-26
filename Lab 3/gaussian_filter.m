function img_filtered = gaussian_filter(img, hsize, sigma)
    kernel = fspecial('gaussian', hsize, sigma);
    img_filtered = sobel_filter(img,kernel, hsize);
end