clear; close all;
img_path = "person_toy/00000001.jpg";
image = imread(img_path);
rotations = [45, 90];
thresholds = [0.04, 0.01];
for i = 1:length(rotations)
    angle = rotations(i);
    image_rot = imrotate(image, angle, "nearest", "crop");
    
    [res_rows, res_cols, res_cornerness, Ix, Iy] = harris_corner_detector(image_rot, thresholds(i));
    disp(length(res_cornerness));
    figure(i);
    imshow(image_rot);
    fig = figure(i);
    hold on;
    plot(res_cols, res_rows, 'r*');
    saveas(fig, sprintf("rotation_%s.jpg", num2str(i)));

end