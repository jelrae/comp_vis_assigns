function [new_image] = GreyWorld(input_image)

% first we extract the R, G and B channels of the input image
R = input_image(:,:,1);
G = input_image(:,:,2);
B = input_image(:,:,3);

% now we compute the average value per independent color channel (Von Kries correction), and the average color
% over all channels
Rmean = mean(mean(R));
Bmean = mean(mean(B));
Gmean = mean(mean(G));

Colormean = ( Rmean + Bmean + Gmean ) ./ 3;

% In order to convert the input image with GreyWorld, we need to calculate
% the scaling values for each color channel

Rscale = Colormean ./ Rmean;
Gscale = Colormean ./ Gmean;
Bscale = Colormean ./ Bmean;

% store a copy of the input image to perform manipulations
new_image = input_image;

% superimposing the scaling factors on their respective color channels on the
% new image
new_image(:,:,1) = Rscale .* new_image(:,:,1);
new_image(:,:,2) = Gscale .* new_image(:,:,2);
new_image(:,:,3) = Bscale .* new_image(:,:,3);

imshow(new_image);
















