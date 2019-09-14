clc;
clear;
%% read image data as double to avoid overflow with unit8 while multiplying 
reflectance_img = im2double(imread("ball_albedo.png"));
shading_img = im2double(imread("ball_shading.png"));
[h,w, dim] = size(reflectance_img);
shading_stack = zeros(h,w, dim);
% we stack 3 pages of shading image for multiplying with reflectance image
for i = 1:dim
    shading_stack(:, :, i) = shading_img;
end
reconstructed_img = shading_stack .* reflectance_img;

%% plotting figures
figure(1);
subplot(131);
imshow("ball_albedo.png");
title("albedo");
subplot(132);
imshow("ball_shading.png");
title("shading");
subplot(133);
imshow(reconstructed_img);
title("reconstructed");


