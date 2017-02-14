image = imread('road1.png');
grayimage = imadjust(rgb2gray(image));
output = edge(grayimage, 'canny',[0 0.52]);
imshow(output, []);
