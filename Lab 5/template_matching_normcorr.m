function [output, match] = template_matching_normcorr(img, template, threshold)
   %% your code here
    output = img;
    [H,W,~] = size(img);
    [tempH, ~,~] = size(template);
    buffer = floor(tempH/2);
    
    for u = 1 + buffer:W-buffer
        for v = 1+buffer:H-buffer
            x1 = u - buffer; x2 = u + buffer;
            y1 = v - buffer; y2 = v + buffer;
            patch = img(y1:y2, x1:x2);
            
            diffPatch = patch(:) - mean(patch(:)) ;
            diffTemp = template(:) - mean(template(:));
            normPatch = norm(diffPatch);
            normTemp = norm(diffTemp);
            patcDotInput = diffPatch ./ normPatch;
            tempDotInput = diffTemp ./ normTemp;
            
            normcorr = dot(patcDotInput,tempDotInput);
            
            output(v,u) = normcorr;
        end
    end
    
    %% threshold
    match = (output > threshold);
    
end