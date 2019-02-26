function img_filtered = sobel_filter(img, kernel, size)
    difference = floor(size/2);
    paddedSize = 512 + (2 * difference);
    newImg = zeros(paddedSize,paddedSize,'uint8');
    
    newImg(difference+1:paddedSize-difference,difference+1:paddedSize-difference) = img;
    
    img_filtered = zeros(512,512,'uint8');
    for u = 1+difference:512+difference
        for v = 1+difference:512+difference
            x1 = v - difference; x2 = v + difference;
            y1 = u - difference; y2 = u + difference;
            
            patch = newImg(y1:y2, x1:x2,:);
            
            value = dot(double(patch(:)),double(kernel(:)));
            img_filtered(u,v) = value;
        end
    end
end