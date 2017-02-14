image = imread('road1.png');
grayimage = rgb2gray(image);
kernel = fspecial('gaussian', 11, 1);
output = convolve2d(grayimage, kernel);
kernel = fspecial('gaussian', 11, 3);
output = convolve2d(grayimage, kernel);
kernel = fspecial('gaussian', 11, 7);
output = convolve2d(grayimage, kernel);

hsobel = fspecial('sobel')/8;
houtput = convolve2d(grayimage, hsobel);
vsobel = hsobel';
voutput = convolve2d(grayimage, vsobel);
output = houtput.^2 + voutput.^2;
output = sqrt(output);
imshow(output, []);

sobel7 = 
[3   2   1   0   -1  -2  -3;
4   3   2   0   -2  -3  -4;
5   4   3   0   -3  -4  -5;
6   5   4   0   -4  -5  -6;
5   4   3   0   -3  -4  -5;
4   3   2   0   -2  -3  -4;
3   2   1   0   -1  -2  -3;]


hsobel = sobel7;
houtput = convolve2d(grayimage, hsobel);
vsobel = hsobel';
voutput = convolve2d(grayimage, vsobel);
output = houtput.^2 + voutput.^2;
output = sqrt(output);
imshow(output, []);

sobel11 = 
[ -1.90734863e-06  -1.90734863e-05  -8.58306885e-05  -2.28881836e-04
   -4.00543213e-04  -4.80651855e-04  -4.00543213e-04  -2.28881836e-04
   -8.58306885e-05  -1.90734863e-05  -1.90734863e-06;
  -1.52587891e-05  -1.52587891e-04  -6.86645508e-04  -1.83105469e-03
   -3.20434570e-03  -3.84521484e-03  -3.20434570e-03  -1.83105469e-03
   -6.86645508e-04  -1.52587891e-04  -1.52587891e-05;
  -5.14984131e-05  -5.14984131e-04  -2.31742859e-03  -6.17980957e-03
   -1.08146667e-02  -1.29776001e-02  -1.08146667e-02  -6.17980957e-03
   -2.31742859e-03  -5.14984131e-04  -5.14984131e-05;
  -9.15527344e-05  -9.15527344e-04  -4.11987305e-03  -1.09863281e-02
   -1.92260742e-02  -2.30712891e-02  -1.92260742e-02  -1.09863281e-02
   -4.11987305e-03  -9.15527344e-04  -9.15527344e-05;
  -8.01086426e-05  -8.01086426e-04  -3.60488892e-03  -9.61303711e-03
   -1.68228149e-02  -2.01873779e-02  -1.68228149e-02  -9.61303711e-03
   -3.60488892e-03  -8.01086426e-04  -8.01086426e-05;
   0.00000000e+00   0.00000000e+00   0.00000000e+00   0.00000000e+00
    0.00000000e+00   0.00000000e+00   0.00000000e+00   0.00000000e+00
    0.00000000e+00   0.00000000e+00   0.00000000e+00;
   8.01086426e-05   8.01086426e-04   3.60488892e-03   9.61303711e-03
    1.68228149e-02   2.01873779e-02   1.68228149e-02   9.61303711e-03
    3.60488892e-03   8.01086426e-04   8.01086426e-05;
   9.15527344e-05   9.15527344e-04   4.11987305e-03   1.09863281e-02
    1.92260742e-02   2.30712891e-02   1.92260742e-02   1.09863281e-02
    4.11987305e-03   9.15527344e-04   9.15527344e-05;
   5.14984131e-05   5.14984131e-04   2.31742859e-03   6.17980957e-03
    1.08146667e-02   1.29776001e-02   1.08146667e-02   6.17980957e-03
    2.31742859e-03   5.14984131e-04   5.14984131e-05;
   1.52587891e-05   1.52587891e-04   6.86645508e-04   1.83105469e-03
    3.20434570e-03   3.84521484e-03   3.20434570e-03   1.83105469e-03
    6.86645508e-04   1.52587891e-04   1.52587891e-05;
   1.90734863e-06   1.90734863e-05   8.58306885e-05   2.28881836e-04
    4.00543213e-04   4.80651855e-04   4.00543213e-04   2.28881836e-04
    8.58306885e-05   1.90734863e-05   1.90734863e-06;]

hsobel = sobel11;
houtput = convolve2d(grayimage, hsobel);
vsobel = hsobel';
voutput = convolve2d(grayimage, vsobel);
output = houtput.^2 + voutput.^2;
output = sqrt(output);
imshow(output, []);




kernel = fspecial('gaussian', 11, 7);
blurred = convolve2d(grayimage, kernel);
kernel = [0,0,0;0,2,0;0,0,0];
doubled = convolve2d(grayimage, kernel);
sharpened = doubled - blurred;
imshow(sharpened, []);



% % blurred_kernel = fspecial('gaussian', 11, 3);
% blurred_kernel = ones(3,3);
% % blurred = convolve2d(grayimage, kernel);
% doubled_kernel = zeros(3,3);
% doubled_kernel(2,2) = 2;
% sharpened = convolve2d(grayimage,  doubled_kernel - (blurred_kernel./9));
% % sharpened = doubled - blurred./9;
% imshow(sharpened, []);
% figure;
% imshow(imsharpen(grayimage),[]);