function feature = multiscale_sobel_feature(img, scale)

    % initialize feature vector
    feature = [];
    for i = 1:scale
        [mag, thetha] = sobel_feature(img);
        % compute sobel feature
        f = thetha; % change img to your sobel feature (magnitude or theta)
        
        % concatenate feature vector
        feature = cat(1, feature, f(:));
        
        % down-sample image by 2
        img = imresize(img, 0.5);
    end
    
end