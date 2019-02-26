function [low_pass_img, high_pass_img] = separate_frequency(img, ratio)

    %% apply FFT
    frequency_map = fft2(img);
    figure, imshow( log(abs(frequency_map) + 1), []);
    
    
    %% shift the frequency map
    

    %% compute low-frequency mask
    % create a rectangular mask whose:
    %       height = ratio * image height
    %       width = ratio * image width
    %       center of the rectangle is the center of the input image
    
    
    %% separate low-frequency and high-frequency maps
    
    
    %% shift frequency maps back
    
    
    %% apply Inverse FFT
    low_pass_img = real(ifft2(frequency_map)); % change frequency_map to your low-frequency map
    high_pass_img = real(ifft2(frequency_map)); % change frequency_map to your high-frequency map
    
end