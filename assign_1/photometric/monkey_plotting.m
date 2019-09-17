close all
clear all
clc
 
disp('Part 1: Photometric Stereo')

% obtain many images in a fixed view under different illumination
disp('Loading images...')

% cycle through the foulders created for sampling different sizes
for i = 41:40:121
    image_dir = strcat('./MonkeyGray',int2str(i),'/');
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

    show_results(albedo, normals, SE);
    show_model(albedo, height_map);

    height_map2 = construct_surface( p, q,'average' );
    show_model(albedo, height_map2);

end

