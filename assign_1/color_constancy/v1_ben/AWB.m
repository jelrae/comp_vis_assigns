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



