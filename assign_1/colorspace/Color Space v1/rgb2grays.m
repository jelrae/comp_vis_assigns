function [output_image] = rgb2grays(input_image)
% converts an RGB into grayscale by using 4 different methods

[R,G,B] = getColorChannels(input_image);
% get R,G and B values for the input image
output_image = input_image;

% ligtness method
% The lightness method averages the most prominent and least prominent colors: (max(R, G, B) + min(R, G, B)) / 2.
lightness = (max(max(R, G), B) + min(min(R, G), B) ) ./ 2;

% average method
% The average method simply averages the values: (R + G + B) / 3.
average_rgb = (R + G + B) ./ 3;

% luminosity method
% The formula for luminosity is 0.21 R + 0.72 G + 0.07 B.
luminosity = 0.21 .*input_image(:,:,1) + 0.72 .*input_image(:,:,2) + 0.07 .*input_image(:,:,3);

% built-in MATLAB function 
output_image = rgb2gray(input_image);

subplot(3,2,1)
imshow(lightness)
title('lightness')

subplot(3,2,2)
imshow(average_rgb)
title('average_rgb')

subplot(3,2,3)
imshow(luminosity)
title('luminosity')

subplot(3,2,4)
imshow(output_image)
title('matlab builtin function')

subplot(3,2,5)
title('d')


end

