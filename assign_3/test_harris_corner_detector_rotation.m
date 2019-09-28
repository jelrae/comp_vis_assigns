clear; close all;
img_path = "person_toy/00000001.jpg";
image = imread(img_path);
rotations = [0, 45, 60, 90];

for i = 1:length(rotations)
    angle = rotations(i);
    image_rot = imrotate(image, angle, "nearest", "crop");
    [res_rows, res_cols, res_cornerness, Ix, Iy] = harris_corner_detector(image_rot);
    disp(length(res_cornerness));
    figure(i);
    imshow(image_rot);
    figure(i);
    hold on;
    plot(res_cols, res_rows, 'r*');
end