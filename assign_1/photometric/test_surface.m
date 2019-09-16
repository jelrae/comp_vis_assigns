close all
clear all
clc

disp('Part 1: Photometric Stereo')

% obtain many images in a fixed view under different illumination
disp('Loading images...')
image_dir = './photometrics_images/SphereGray25/';   % TODO: get the path of the script
%image_ext = '*.png';

[master_image_stack, master_scriptV] = load_syn_images(image_dir);
[h, w, n] = size(master_image_stack);
fprintf('Finish loading %d images.\n\n', n);
disp('Computing surface albedo and normal map...')
figure;

for i = 1:5
    image_stack = master_image_stack(:,:,1:5*i);
    scriptV = master_scriptV(1:5*i,:);
    [h, w, n] = size(image_stack);
    fprintf('Finish loading %d images.\n\n', n);

    % compute the surface gradient from the stack of imgs and light source mat
    disp('Computing surface albedo and normal map...')
    [albedo, normals] = estimate_alb_nrm(image_stack, scriptV);

    %% integrability check: is (dp / dy  -  dq / dx) ^ 2 small everywhere?
    disp('Integrability checking')
    [p, q, SE] = check_integrability(normals);

    threshold = 0.05;
    SE(SE <= threshold) = NaN; % for good visualization
    fprintf('Number of outliers: %d\n\n', sum(sum(SE > threshold)));

    %% compute the surface height
    subplot(1,5,i);
    height_map_avg = construct_surface( p, q, 'average' );
    %% Display
    [hgt, wid] = size(height_map_avg);
    [X,Y] = meshgrid(1:wid, 1:hgt);
    H = rot90(fliplr(height_map_avg), 2);
    A = rot90(fliplr(albedo), 2);

 
    mesh(H, X, Y, A);
    axis equal; 
    xlabel('Z')
    ylabel('X')
    zlabel('Y')
    title(strcat('Height Map of', num2str(i*5),' images'));
    view(-60,20)
    colormap(gray)
    set(gca, 'XDir', 'reverse')
    set(gca, 'XTick', []);
    set(gca, 'YTick', []);
    set(gca, 'ZTick', []);
end

disp('Loading images...')
image_dir = './photometrics_images/SphereGray5/';   % TODO: get the path of the script
%image_ext = '*.png';
[image_stack, scriptV] = load_syn_images(image_dir);
[h, w, n] = size(image_stack);
fprintf('Finish loading %d images.\n\n', n);

% compute the surface gradient from the stack of imgs and light source mat
disp('Computing surface albedo and normal map...')
[albedo, normals] = estimate_alb_nrm(image_stack, scriptV);
%% integrability check: is (dp / dy  -  dq / dx) ^ 2 small everywhere?
disp('Integrability checking')
[p, q, SE] = check_integrability(normals);

threshold = 0.005;
SE(SE <= threshold) = NaN; % for good visualization
fprintf('Number of outliers: %d\n\n', sum(sum(SE > threshold)));

%% compute the surface height
height_map_col = construct_surface( p, q );
height_map_row = construct_surface( p, q, 'row');
show_model(albedo, height_map_col);
show_model(albedo, height_map_row);
