close all
clear all
clc
% obtain many images in a fixed view under different illumination
disp('Loading images...')
image_dir = './photometrics_images/SphereColor/';   % TODO: get the path of the script
%image_ext = '*.png';
% compute the surface gradient from the stack of imgs and light source mat
disp('Computing surface albedo and normal map...')
normals = 0;
for c = 1:3 
    [image_stack, scriptV] = load_syn_images(image_dir, c);
    [albedo(:,:,c), normal] = estimate_alb_nrm(image_stack, scriptV);
    normals = normals + normal;
    [h,w,n] = size(image_stack);
    fprintf('Finish loading %d images.\n\n', n);
end
normals = normals/3;

%% integrability check: is (dp / dy  -  dq / dx) ^ 2 small everywhere?
disp('Integrability checking')
[p, q, SE] = check_integrability(normals);

threshold = 0.05;
SE(SE <= threshold) = NaN; % for good visualization
fprintf('Number of outliers: %d\n\n', sum(sum(SE > threshold)));

%% compute the surface height
height_map = construct_surface( p, q, 'column');

%% Display
show_results(albedo, normals, SE);
show_model(albedo, height_map);
