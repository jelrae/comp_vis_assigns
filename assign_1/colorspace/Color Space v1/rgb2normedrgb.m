function [output_image] = rgb2normedrgb(input_image)

[R,G,B] = getColorChannels(input_image);
% get R,G and B values for the input image

% convert R, G and B to normalized r, g and b
r = R./(R+G+B);
g = G./(R+G+B);
b = B./(R+G+B);

output_image = input_image;
%copy the input image into output variable

output_image(:,:,1) = r;
output_image(:,:,2) = g;
output_image(:,:,3) = g;
% replace RGB with normalized rgb values

subplot(3,2,1)
imshow(r)
title('Normalized R color channel')

subplot(3,2,2)
imshow(g)
title('Normalized G color channel')

subplot(3,2,3)
imshow(b)
title('Normalized B color channel')

subplot(3,2,4)
imshow(output_image)
title('Normalized RGB image')

subplot(3,2,5)
imshow(input_image)
title('original image')

imshow(input_image)
end

