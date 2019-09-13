clc;
clear;
% it is IMPORTANT to convert image to double to overcome overflow with
% default uint8 when using element wise multiplication
reflctance_img = im2double(imread("ball_albedo.png"));
shading_img = im2double(imread("ball_shading.png"));
shading_stack = cat(3, shading_img, shading_img, shading_img);
constructed_img = shading_stack .* reflctance_img;
%% plotting the results side by side
figure(1);
subplot(131);
imshow("ball_albedo.png");
title("albedo");
subplot(132);
imshow("ball_shading.png");
title("shading");
subplot(133);
imshow(constructed_img);
title("reconstructed");


