image = imread('road2.png');
grayimage = rgb2gray(image); 
grayimage = imgaussfilt(grayimage, 2);
grayimage = imsharpen(grayimage, 'Amount', 5);
smthn = imbinarize(grayimage, 'adaptive','Sensitivity', 0.4);
imshow(smthn, []);





% canny edge start
image = imread('road2.png');
grayimage = rgb2gray(image);
output = edge(grayimage, 'canny',[0.05 0.25]);
imshow(output, []);
% canny edge over



%obtained from: https://in.mathworks.com/help/images/hough-transform.html
image = imread('road2.png');
grayimage = rgb2gray(image);
edged = edge(grayimage, 'canny', [0 0.25]);
[houghed, theta, rho] = hough(edged);
P = houghpeaks(houghed,25,'threshold',ceil(0.5*max(houghed(:))));
lines = houghlines(edged,theta,rho,P,'FillGap',5,'MinLength',7);
figure, imshow(image), hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end
% highlight the longest line segment
plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','red');