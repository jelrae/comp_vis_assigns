close all
clear all
clc
 
disp('Part 1: Photometric Stereo')

% obtain many images in a fixed view under different illumination
disp('Loading images...')
figure
for i = 5:5:25
    image_dir = strcat('./SphereGray',int2str(i),'/');
    % TODO: get the path of the script
    %image_ext = '*.png';

    [image_stack, scriptV] = load_syn_images(image_dir);
    image_stack = im2double(image_stack);


    [h, w, n] = size(image_stack);
    fprintf('Finish loading %d images.\n\n', n);

    % compute the surface gradient from the stack of imgs and light source mat
    disp('Computing surface albedo and normal map...')
    [albedo, normals] = estimate_alb_nrm(image_stack, scriptV, false);

    %% integrability check: is (dp / dy  -  dq / dx) ^ 2 small everywhere?
    disp('Integrability checking')
    [p, q, SE] = check_integrability(normals);

    threshold = 0.05;
    SE(SE <= threshold) = NaN; % for good visualization
    fprintf('Number of outliers: %d\n\n', sum(sum(SE > threshold)));

    %% compute the surface height
    height_map = construct_surface( p, q, 'column');

    %% Display

    subplot(1, 5, i/5);
    title
    imshow(albedo)
%     show_results(albedo, normals, SE);
%     show_model(albedo, height_map);
%     %My shit start
%     height_map1 = construct_surface( p, q,'row' );
%     show_model(albedo, height_map1);
% 
%     height_map2 = construct_surface( p, q,'average' );
%     show_model(albedo, height_map2);

end
% %% Face
% [image_stack, scriptV] = load_face_images('./yaleB02/');
% [h, w, n] = size(image_stack);
% fprintf('Finish loading %d images.\n\n', n);
% disp('Computing surface albedo and normal map...')
% [albedo, normals] = estimate_alb_nrm(image_stack, scriptV, false);
% 
% %% integrability check: is (dp / dy  -  dq / dx) ^ 2 small everywhere?
% disp('Integrability checking')
% [p, q, SE] = check_integrability(normals);
% 
% threshold = 0.05;
% SE(SE <= threshold) = NaN; % for good visualization
% fprintf('Number of outliers: %d\n\n', sum(sum(SE > threshold)));
% 
% %% compute the surface height
% height_map = construct_surface( p, q , 'row');
% 
% show_results(albedo, normals, SE);
% show_model(albedo, height_map);

