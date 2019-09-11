function [output_image] = rgb2opponent(input_image)
% converts an RGB image into opponent color space

[R,G,B] = getColorChannels(input_image);
% get R,G and B values for the input image

% convert R, G and B to O1, O2, O3 values
O1 = (R-G)./ sqrt(2);
O2 = (R+G-(2.*B)) ./ sqrt(6);
O3 = (R+G+B)/sqrt(3);

output_image = input_image;
%copy the input image into output variable

output_image(:,:,1) = O1;
output_image(:,:,2) = O2;
output_image(:,:,3) = O3;
%replace the R, G and B channels of the input image w/ the newly computed
%O1, O2 and O3 channels

subplot(3,2,1)
imshow(O1)
title('Channel O1')

subplot(3,2,2)
imshow(O2)
title('Channel O2')

subplot(3,2,3)
imshow(O3)
title('Channel O3')

subplot(3,2,4)
imshow(output_image)
title('Opponent Image')

subplot(3,2,5)
imshow(input_image)
title('original image')

end

