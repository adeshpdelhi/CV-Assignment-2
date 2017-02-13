image = imread('road1.png');
grayimage = rgb2gray(image);
kernel = fspecial('gaussian', 11, 1);
output = convolve2d(grayimage, kernel);
kernel = fspecial('gaussian', 11, 3);
output = convolve2d(grayimage, kernel);
kernel = fspecial('gaussian', 11, 7);
output = convolve2d(grayimage, kernel);