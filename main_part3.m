clear all;
% segimage = imread('segm.png');
% means = zeros(3,9);
% for i=[1:9],
% 	imshow(segimage,[]); 
% 	coords = getrect();
% 	% close all;
% 	sub_image = imcrop(segimage, coords);
% 	means(1,i) = mean(mean(sub_image(:,:,1)));
% 	means(2,i) = mean(mean(sub_image(:,:,2)));
% 	means(3,i) = mean(mean(sub_image(:,:,3)));
% end
% means

load means.mat

% means =

%   184.1236  138.5793  124.1283  159.1056  196.3493  174.8797  145.5244  170.7370   71.6450
%   138.4620  110.5509  141.2508  140.6758  124.0279  111.3883  136.3074   78.7539   84.9630
%    79.9451  147.5916   79.9544  132.5140   87.8960  114.4576  123.2143   49.1916   69.7846


product_names = cell(9,1);
product_names{1} = 'Fanta - Orange Flavor';
product_names{2} = 'Fanta - Grape Flavor';
product_names{3} = 'Vault Energy Drink';
product_names{4} = 'Minute maid lemonade';
product_names{5} = 'Coca cola vanilla';
product_names{6} = 'Coca cola strawberry';
product_names{7} = 'Barq root beer';
product_names{8} = 'Coca cola classic';
product_names{9} = 'Sprite';


image = imread('AmazonGO.jpg');
imshow(image, []);
coords = getrect();
close all;
sub_image = imcrop(image, coords);

rgb_avg = zeros(3,1);
rgb_avg(1,1) = mean(mean(sub_image(:,:,1)));
rgb_avg(2,1) = mean(mean(sub_image(:,:,2)));
rgb_avg(3,1) = mean(mean(sub_image(:,:,3)));

min_index = -1;
min_value = Inf;
for i = [1:9],
	if(norm(rgb_avg - means(:,i))  < min_value)
		min_value = norm(rgb_avg-means(:,i));
		min_index = i;
	end
end


product_names{min_index}