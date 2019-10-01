clear; close all;
img_path = "person_toy/00000001.jpg";
image = imread(img_path);
%% plotting
threshold = 0.05;
[res_rows, res_cols, res_cornerness, Ix, Iy] = harris_corner_detector(image, threshold);
disp(length(res_cornerness));
figure(1);
subplot(121);
imshow(Ix);
subplot(122);
imshow(Iy);

figure(2);
imshow(image);
figure(2);
hold on;
plot(res_cols, res_rows, 'r*');