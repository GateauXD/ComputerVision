
name = 'einstein1';
%name = 'einstein2';

img = im2double(imread(sprintf('%s.jpg', name)));
template = im2double(imread('template.jpg'));

%% SSD
%Edision 1
threshold = 25;
%Edision 2
%threshold = 30;
[output, match] = template_matching_SSD(img, template, threshold);

figure, imshow(output ./ max(output(:))); title('SSD output');
figure, imshow(match); title('SSD match');

imwrite(output ./ max(output(:)), sprintf('%s_ssd_output.jpg', name) );
imwrite(match, sprintf('%s_ssd_match.jpg', name) );


%% Normalized Cross-Correlation
%Edision 1
%threshold = .5;
%Edision 2
threshold = .5;
[output, match] = template_matching_normcorr(img, template, threshold);

figure, imshow(output ./ max(output(:))); title('NormCorr output');
figure, imshow(match); title('NormCorr match');

imwrite(output ./ max(output(:)), sprintf('%s_normcorr_output.jpg', name) );
imwrite(match, sprintf('%s_normcorr_match.jpg', name) );
