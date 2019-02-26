function img_filtered = median_filter(img, patch_size)
    difference = floor(patch_size/2);
    img_filtered = zeros(512,512,3,'uint8');
    for u = 1+difference:512-difference
        for v = 1+difference:512 -difference
            x1 = v - difference; x2 = v + difference;
            y1 = u - difference; y2 = u + difference;
            
            patch = img(y1:y2, x1:x2,:);
            
            value = median(patch(:));
            img_filtered(u,v,:) = value*255;
        end
    end
end