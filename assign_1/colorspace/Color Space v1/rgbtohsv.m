function [output_image] = rgbtohsv(input_image)
new_image = rgb2hsv(input_image);

[H, S, V] = getColorChannels(new_image);

subplot(3,2,1)
imshow(H)
title('Channel Hue')

subplot(3,2,2)
imshow(S)
title('Channel Saturation')

subplot(3,2,3)
imshow(V)
title('Channel Value')

subplot(3,2,4)
imshow(new_image)
title('HSV Image')
