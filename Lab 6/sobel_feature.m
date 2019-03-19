function [magnitude, orientation] = sobel_feature(img)

    Hy = [1, 2, 1; 0, 0, 0; -1, -2, -1]; % horizontal edge
    Hx = [1, 0, -1; 2, 0, -2; 1, 0, -1]; % vertical edge
    
    %% Sobel filtering
    gy = imfilter(img, Hy);
    gx = imfilter(img,Hx);
    
    %% compute gradient magnitude and orientation
    magnitude = sqrt(gy.^2 + gx.^2); % change img to your gradient magnitude
    orientation = atan2(gy,gx); % change img to your gradient orientation
end