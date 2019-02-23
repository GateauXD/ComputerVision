function img_filtered = median_filter(img, patch_size)
    difference = 1;
    medianFilter = zeros(512,512,3,'uint8');
    for x1 = 1:512- difference
        for y1 = 1:512 -difference
            medianPixel = zeros(1, 1, 3,'uint8');
            xrange = x1-difference;
            xRangeEnd = xrange + patch_size;
            yrange = y1-difference;
            yRangeEnd = yrange + patch_size;
            for meanX1 = xrange:xRangeEnd
                for meanY1 = yrange:yRangeEnd
                    medianPixel = medianPixel + img(meanY1, meanX1, :); 
                end
            end
            medianPixel = medianPixel / patch_size;
            medianFilter(y1,x1,:) = medianPixel;
        end
    end
    imwrite(medianFilter, 'medianFilter.jpg');
end