function img_filtered = white_padding(img, patch_size)
    difference = floor(patch_size/2);
    newSize = 512 + (difference * 2);
    img_filtered = zeros(newSize,newSize,3,'uint8');
    for u = 1+difference:512-difference
        for v = 1+difference:512-difference   
            x1 = v - difference; y1 = u - difference;
            img_filtered(u,v,:) = img(x1, y1,:)*255;
        end
    end
end