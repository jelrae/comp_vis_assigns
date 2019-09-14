function [reconstructed_img] = iid_image_formation(albedo_img_path, shading_img_path)

%% read image data as double to avoid overflow with unit8 while multiplying 
albedo_img = im2double(imread(albedo_img_path));
shading_img = im2double(imread(shading_img_path));
[h,w, dim] = size(albedo_img);
shading_stack = zeros(h,w, dim);
% we stack 3 pages of shading image for multiplying with reflectance image
for i = 1:dim
    shading_stack(:, :, i) = shading_img;
end
reconstructed_img = shading_stack .* albedo_img;