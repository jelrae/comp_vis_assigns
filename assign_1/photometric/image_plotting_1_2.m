close all
clear all
clc
 
disp('Part 1: Photometric Stereo')

% obtain many images in a fixed view under different illumination
disp('Loading images...')
%figure
plot_num = 1
for i = 25
% for i = 5:4:25
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
%     height_map = construct_surface( p, q, 'column');

    %% Display

%    show_results(albedo, normals, SE);
%    show_model(albedo, height_map);

    %Figure creation begins
    subplot(3, 1, 1);
    height_map = construct_surface( p, q, 'column');
    [hgt, wid] = size(height_map);
    [X,Y] = meshgrid(1:wid, 1:hgt);
    H = rot90(fliplr(height_map), 2);
    A = rot90(fliplr(albedo), 2);


    mesh(H, X, Y, A);
    axis equal;
    xlabel('Z')
    ylabel('X')
    zlabel('Y')
    title('Height Map Column')
    view(-60,20)
    colormap(gray)
    set(gca, 'XDir', 'reverse')
    set(gca, 'XTick', []);
    set(gca, 'YTick', []);
    set(gca, 'ZTick', []);
%     view([0,0])
    
%     subplot(3, 2, 2);
%     height_map = construct_surface( p, q, 'column');
%     [hgt, wid] = size(height_map);
%     [X,Y] = meshgrid(1:wid, 1:hgt);
%     H = rot90(fliplr(height_map), 2);
%     A = rot90(fliplr(albedo), 2);
%     
% 
% 
%     mesh(H, X, Y, A);
%     axis equal;
%     xlabel('Z')
%     ylabel('X')
%     zlabel('Y')
%     title('Height Map Column')
%     view(-60,20)
%     colormap(gray)
%     set(gca, 'XDir', 'reverse')
%     set(gca, 'XTick', []);
%     set(gca, 'YTick', []);
%     set(gca, 'ZTick', []);
%     view(3)
    
    subplot(3, 1, 2);
    height_map = construct_surface( p, q, 'row');
    [hgt, wid] = size(height_map);
    [X,Y] = meshgrid(1:wid, 1:hgt);
    H = rot90(fliplr(height_map), 2);
    A = rot90(fliplr(albedo), 2);


    mesh(H, X, Y, A);
    axis equal;
    xlabel('Z')
    ylabel('X')
    zlabel('Y')
    title('Height Map Row')
    view(-60,20)
    colormap(gray)
    set(gca, 'XDir', 'reverse')
    set(gca, 'XTick', []);
    set(gca, 'YTick', []);
    set(gca, 'ZTick', []);
%     view(1)
    
%     subplot(3, 2, 4);
%     height_map = construct_surface( p, q, 'row');
%     [hgt, wid] = size(height_map);
%     [X,Y] = meshgrid(1:wid, 1:hgt);
%     H = rot90(fliplr(height_map), 2);
%     A = rot90(fliplr(albedo), 2);
% 
% 
%     mesh(H, X, Y, A);
%     axis equal;
%     xlabel('Z')
%     ylabel('X')
%     zlabel('Y')
%     title('Height Map Method Row')
%     view(-60,20)
%     colormap(gray)
%     set(gca, 'XDir', 'reverse')
%     set(gca, 'XTick', []);
%     set(gca, 'YTick', []);
%     set(gca, 'ZTick', []);
%     view(3)
    
    subplot(3, 1, 3);
    height_map = construct_surface( p, q, 'average');
    [hgt, wid] = size(height_map);
    [X,Y] = meshgrid(1:wid, 1:hgt);
    H = rot90(fliplr(height_map), 2);
    A = rot90(fliplr(albedo), 2);


    mesh(H, X, Y, A);
    axis equal;
    xlabel('Z')
    ylabel('X')
    zlabel('Y')
    title('Height Map Average')
    view(-60,20)
    colormap(gray)
    set(gca, 'XDir', 'reverse')
    set(gca, 'XTick', []);
    set(gca, 'YTick', []);
    set(gca, 'ZTick', []);
%     view(1)
    
%     subplot(3, 2, 6);
%     height_map = construct_surface( p, q, 'average');
%     [hgt, wid] = size(height_map);
%     [X,Y] = meshgrid(1:wid, 1:hgt);
%     H = rot90(fliplr(height_map), 2);
%     A = rot90(fliplr(albedo), 2);
% 
% 
%     mesh(H, X, Y, A);
%     axis equal;
%     xlabel('Z')
%     ylabel('X')
%     zlabel('Y')
%     title('Height Map Average')
%     view(-60,20)
%     colormap(gray)
%     set(gca, 'XDir', 'reverse')
%     set(gca, 'XTick', []);
%     set(gca, 'YTick', []);
%     set(gca, 'ZTick', []);
%     view(3)
    
    %Show SE plots
%     subplot(1, 6, plot_num);
%     [X, Y] = meshgrid(1:w, 1:h);
%     surf(X, Y, SE, gradient(SE));
%     title_str = strcat(int2str(i),' Images Used');
%     title(title_str);
%     plot_num = plot_num + 1;
    
    % Show albedo plots
%     imshow(albedo);
%     title_str = strcat(int2str(i),' Images Used');
%     title(title_str);
%     plot_num = plot_num + 1


%     %My shit start
%     height_map1 = construct_surface( p, q,'row' );
%      show_model(albedo, height_map1);
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

