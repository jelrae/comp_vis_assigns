clear; close all;
img_path = "person_toy/00000001.jpg";
image = imread(img_path);
%% plotting
thresholds = [0.01,0.05, 0.1, 1];
L = length(thresholds);
for i = 1:L
    threshold = thresholds(i);
    [res_rows, res_cols, res_cornerness, Ix, Iy] = harris_corner_detector(image, threshold);
    disp(length(res_cornerness));
    fig = figure(2);
    imshow(image);
    figure(2);
    hold on;
    plot(res_cols, res_rows, 'r*');
    saveas(fig, sprintf("results/threshold_%s.jpg", num2str(i)));
end