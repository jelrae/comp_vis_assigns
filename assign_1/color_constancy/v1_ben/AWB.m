%% Read the image and have RGB channels separated
clear;
I = imread('bluesky.jpg');
R = I(:,:,1); % Red
G = I(:,:,2); % Green
B = I(:,:,3); % Blue

%% Then we scale each channel by mean_grey / mean_channel
% note that we can assume mean grey to be 128 or take global avg
mean_grey = mean(I, "ALL");
% disp(mean_grey)
% mean_grey = 128;
R_new =  (mean_grey / mean(R, "ALL") ) * R;
G_new =  (mean_grey/ mean(G, "ALL") ) * G;
B_new =  (mean_grey / mean(B, "ALL") ) * B;

%% concat new image and show in pair
new_I = cat(3, R_new, G_new, B_new);
figure, subplot(121), imshow(I), title("original image");
subplot(122), imshow(new_I), title("white balanced image");

% % % % % 
% this approach will fail when the dominant illumination is not neutral
% grey. For example, for blue sky.
% wikipedia: 
% it does not account for all variations of illumination intensity 
% and it is not dynamic, also due to the grey world assumption; 
% when new objects appear in the scene it fails.

% % % % % 
% The perfect reflector algorithm
% is based on the assumption that the brightest pixel in an image
% corresponds to the white point. Specular or glossy surfaces reflect the actual color
% of the light source because their reflectance functions are constant 
% over a wide range of wavelengths.
% The perfect reflector algorithm locates the brightest pixel
% and assigns it as the reference white point.




