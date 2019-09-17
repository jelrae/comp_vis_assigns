close all
clear all
clc
 
disp('Part 1: Photometric Stereo')

% obtain many images in a fixed view under different illumination
disp('Loading images...')
figure
plot_num = 1
for i = 5:4:25
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

    %% Display
    subplot(1, 6, plot_num);
    imshow(albedo);
    title_str = strcat(int2str(i),' Images Used');
    title(title_str);
    plot_num = plot_num + 1

end

