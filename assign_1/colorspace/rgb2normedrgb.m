function [output_image] = rgb2normedrgb(input_image)
% converts an RGB image into normalized rgb
    [R, G, B] = getColorChannels(input_image);
    output_image = input_image;
    nR = R./(R + G + B);
    nG = G./(R + G + B);
    nB = B./(R + G + B);
    output_image(:,:,1) = nR;
    output_image(:,:,2) = nG;
    output_image(:,:,3) = nB;
end

