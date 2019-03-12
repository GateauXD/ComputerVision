function [output, match] = template_matching_SSD(img, template, threshold)

    output = img;
    [H,W,~] = size(img);
    [tempH, ~,~] = size(template);
    buffer = floor(tempH/2);
    
    %% your code here
    for u = 1 + buffer:W-buffer
        for v = 1+buffer:H-buffer
            x1 = u - buffer; x2 = u + buffer;
            y1 = v - buffer; y2 = v + buffer;
            patch = img(y1:y2, x1:x2);
            
            value = (patch(:) - template(:)).^2;
            output(v,u) = sum(value);
        end
    end
    
    %% threshold
    match = (output < threshold);
    
end