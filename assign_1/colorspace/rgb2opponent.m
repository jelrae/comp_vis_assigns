function [output_image] = rgb2opponent(input_image)
% converts an RGB image into opponent color space
    [R, G, B] = getColorChannels(input_image);
    output_image = input_image;
    o1 = (R - G)/sqrt(2);
    o2 = (R + G - 2*B)/sqrt(6);
    o3 = (R + G + B)/sqrt(3);
    output_image(:,:,1) = o1;
    output_image(:,:,2) = o2;
    output_image(:,:,3) = o3;
end

