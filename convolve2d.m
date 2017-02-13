function [output_image] = convolve2d(image, kernel)
	m = size(image, 1);
	n = size(image, 2);
	k = length(kernel);
	output_image = zeros(m-k,n-k);
	for i = [1:m],
		fprintf('%d\n',i);
		for j = [1:n],	
			if(i+k> m || j+k>n),
				continue			
			end
			sub_patch = double(imcrop(image, [j, i, k-1, k-1]));
			output_image(i,j) = sum(sum(sub_patch.*kernel));
		end	
	end
	% output_image = imcrop(output_image, [0, 0, m, n]);
	output_image = floor(output_image);
	imshow(output_image, []);
end
