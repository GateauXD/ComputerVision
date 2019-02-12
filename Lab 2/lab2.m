img1 = imread('01.jpg');

%Task 1
shiftedImg =  zeros(325, 400, 3, 'uint8');

for x1 = 1:400
    for y1 = 1:300
        x2 = x1;
        y2 = y1;
        shiftedImg(y1, x1, :) = img1(y2, x2, :);
    end
end
imwrite(shiftedImg, 'translate.jpg');

%Task 2
rotatedImage = zeros(300, 400, 3, 'uint8');
degree = 60;
for x1 = 1:400
    for y1 = 1:300
        x2 =  ceil(cosd(degree)*(x1 - 200) + sind(degree)*(y1 -150)) + 200;
        y2 =  ceil(-sind(degree)*(x1 - 200) + cosd(degree)*(y1 -150)) + 150;
       
        if y2 <= 300 && y2 > 0 && x2 <= 400 && x2 > 0
            rotatedImage(y2, x2, :) = img1(y1, x1, :);
        end
    end
end
imwrite(rotatedImage, 'rotateF.jpg');

%Task 3
rotateB = zeros(300, 400, 3, 'uint8');
degree = 60;
for x1 = 1:400
    for y1 = 1:300
        x2 =  round(cosd(degree)*(x1 - 200) + sind(degree)*(y1 -150)+ 200);
        y2 =  round(-sind(degree)*(x1 - 200) + cosd(degree)*(y1 -150) + 150);
       
        if y2 <= 300 && y2 > 0 && x2 <= 400 && x2 > 0
            rotateB(y1, x1, :) = img1(y2, x2, :);
        end
    end
end
imwrite(rotateB, 'rotateB.jpg');

%Task 4
flipedImage = img1;
for y1 = 1:300
    for x1 = 1:400
        y2 = 301 - y1;
        x2 = x1;
        
        flipedImage(y1, x1, :) = img1(y2, x2, :);
    end
end
imwrite(flipedImage, 'flipped.jpg');
%Task 5
downImage = zeros(150, 200, 3, 'uint8');

for x1 = 1:400
    for y1 = 1:300
        if mod(y1, 2) == 0 && mod(x1,2) == 0
            x2 = x1/2;
            y2 = y1/2;
            downImage(y2, x2,:) = img1(y1,x1,:);
        end
    end
end
imwrite(downImage, 'downscaled.jpg');
