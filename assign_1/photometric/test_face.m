close all
clear all
clc
% obtain many images in a fixed view under different illumination
disp('Loading images...')
image_dir = './photometrics_images/yaleB02/';   % TODO: get the path of the script
%image_ext = '*.png';
% compute the surface gradient from the stack of imgs and light source mat
disp('Computing surface albedo and normal map...')
[image_stack, scriptV] = load_face_images(image_dir);
[albedo, normals] = estimate_alb_nrm(image_stack, scriptV, false);

%% integrability check: is (dp / dy  -  dq / dx) ^ 2 small everywhere?
disp('Integrability checking')
[p, q, SE] = check_integrability(normals);

threshold = 0.05;
SE(SE <= threshold) = NaN; % for good visualization
fprintf('Number of outliers: %d\n\n', sum(sum(SE > threshold)));


%% compute the surface height
height_map_col = construct_surface( p, q, 'column');
height_map_row = construct_surface( p, q, 'row');
height_map_avg = construct_surface( p, q, 'average');
%% Display
% show_results(albedo, normals, SE);
%show_model(albedo,height_map_col);
%show_model(albedo,height_map_row);
%show_model(albedo,height_map_avg);


%% after trim down some pics
close all
clear all
clc
% obtain many images in a fixed view under different illumination
disp('Loading images...')
image_dir = './photometrics_images/yaleB03/';   % TODO: get the path of the script
%image_ext = '*.png';
% compute the surface gradient from the stack of imgs and light source mat
disp('Computing surface albedo and normal map...')
[image_stack, scriptV] = load_face_images(image_dir);
[albedo, normals] = estimate_alb_nrm(image_stack, scriptV, false);

%% integrability check: is (dp / dy  -  dq / dx) ^ 2 small everywhere?
disp('Integrability checking')
[p, q, SE] = check_integrability(normals);

threshold = 0.05;
SE(SE <= threshold) = NaN; % for good visualization
fprintf('Number of outliers: %d\n\n', sum(sum(SE > threshold)));


%% compute the surface height
height_map_col = construct_surface( p, q, 'column');
height_map_row = construct_surface( p, q, 'row');
height_map_avg = construct_surface( p, q, 'average');

%% dispaly
show_model(albedo,height_map_col);
show_model(albedo,height_map_row);
show_model(albedo,height_map_avg);
