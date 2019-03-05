function img_merged = hybrid_image(img1, img2, ratio)

    %% split img1 and img2 into low/high frequency maps
    [img1_low, img1_high] = separate_frequency(img1,ratio);
    [img2_low, img2_high] = separate_frequency(img2,ratio);
    
    %% combine the low-frequency map of img1 with the high-frequency map of img2
    img1_merged = img1_low + img2_high;
    
    img_merged = img1_merged
end
