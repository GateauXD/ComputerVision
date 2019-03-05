img = im2double(imread('images/cameraman.jpg'));
dog = im2double(imread('images/dog.jpg'));
cat = im2double(imread('images/cat.jpg'));

ratio = 0.1;
[low_pass_img, high_pass_img] = separate_frequency(img,ratio);
imwrite(low_pass_img, "cameraman_low_1.jpg");
imwrite(high_pass_img + 0.5, "cameraman_high_1.jpg");

ratio = 0.2;
[low_pass_img, high_pass_img] = separate_frequency(img,ratio);
imwrite(low_pass_img, "cameraman_low_2.jpg");
imwrite(high_pass_img + 0.5, "cameraman_high_2.jpg");

ratio = .3;
hybrid_1 = hybrid_image(dog,cat,ratio);
imwrite(hybrid_1,"hybrid_1.jpg");

ratio = .2;
hybrid_2 = hybrid_image(cat,dog,ratio);
imwrite(hybrid_2,"hybrid_2.jpg");
