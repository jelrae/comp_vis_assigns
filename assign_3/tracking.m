function tracking(imgs, sects)
    [h,w,~,count_images] = size(imgs);
    % detect interesting points
    [rows, cols, corners_1, Ix, Iy] = harris_corner_detector(imgs(:,:,:,1), 0.05);
    for i = 1:count_images-1

        img = im2double(rgb2gray(imgs(:,:,:,i)));
        img2 = im2double(rgb2gray(imgs(:,:,:,i+1)));
        
        for j = 1:length(rows)
            corners(j,1) = rows(j);
            corners(j,2) = cols(j);
        end
        
        % trim down corners to avoid negative indices
        bad_point_lowerx = find(corners(:,1)<floor(sects/2)+1);
        corners(bad_point_lowerx,:) = [];

        bad_point_upperx = find(corners(:,1)>(h-floor(sects/2)+1));
        corners(bad_point_upperx,:) = [];

        bad_point_lowery = find(corners(:,2)<floor(sects/2)+1);
        corners(bad_point_lowery,:) = [];

        bad_point_uppery = find(corners(:,2)>(w-floor(sects/2)+1));
        corners(bad_point_uppery,:) = [];

        rows = corners(:,1);
        %size(rows)
        cols = corners(:,2);
        %size(cols)
        % construct windows for interesting points
        for j = 1:length(rows)
            x_low = corners(j,1)-floor(sects/2);
            y_low = corners(j,2)-floor(sects/2);
            x_high = corners(j,1)+floor(sects/2);
            y_high = corners(j,2)+floor(sects/2);
            %if x_low>0 && y_low>0
            patches_1(:,:,j) = img(x_low:x_high, y_low:y_high);
            patches_2(:,:,j) = img2(x_low:x_high, y_low:y_high);    
            %end
        end    
         
        for k = 1:length(rows)
            v = solve_sys(patches_1(:,:,k), patches_2(:,:,k));
            flow_h(k) = v(1);
            flow_w(k) = v(2);
        
        end
        
        image = imgs(:,:,:,i);
        fig = figure('visible','off');
        imshow(image);
        hold on;
        quiver(rows, cols, flow_h(1:length(rows)).', flow_w(1:length(rows)).');
        cols = round((cols +(floor(sects/2).* flow_w)));
        rows = round((rows +(floor(sects/2).* flow_h)));
    end
 
end

function v = solve_sys(window1, window2)
    [Ix, Iy] = imgradientxy(window1);
    A = [Ix(:), Iy(:)];
    b = window1(:) - window2(:);
%   v = inv(A' * A) * A'* b;
    v = (A' * A)\A' * b;

end