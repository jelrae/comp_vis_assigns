function tracking_attempt(name, imgs, sects)
    
    output = VideoWriter(sprintf('result_tracking/%s.avi', name));
    output.FrameRate = 10;
    open(output);
    scaling = 10;
    [h,w,~,count_images] = size(imgs);
    % detect interesting points
    [rows, cols, corners_1, Ix, Iy] = harris_corner_detector(imgs(:,:,:,1),0.05);
    
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

        bad_point_upperx = find(corners(:,1)>(h-floor(sects/2)-1));
        corners(bad_point_upperx,:) = [];

        bad_point_lowery = find(corners(:,2)<floor(sects/2)+1);
        corners(bad_point_lowery,:) = [];

        bad_point_uppery = find(corners(:,2)>(w-floor(sects/2)-1));
        corners(bad_point_uppery,:) = [];
        
        flow = zeros(size(corners,1),2);

        rows = corners(:,1);
        cols = corners(:,2);
  
        % construct windows for interesting points
        for j = 1:length(rows)
            x_low = corners(j,1)-floor(sects/2);
            y_low = corners(j,2)-floor(sects/2);
            x_high = corners(j,1)+floor(sects/2);
            y_high = corners(j,2)+floor(sects/2);
            
            patch_1(:,:) = img(x_low:x_high, y_low:y_high);
            patch_2(:,:) = img2(x_low:x_high, y_low:y_high); 
            flow(j,:) = lucas_kanade(patch_1, patch_2, 15);
 
        end   
        
        image = imgs(:,:,:,i);
        fig = figure(1);
        imshow(image);
        hold on;
        hor = flow(:,1);
        ver = flow(:,2);
        quiver(cols, rows, hor, ver, 'color', [0, 0, 1]);
        %[max_v,~] = max(abs(ver(:)));
        %[max_h,~] = max(abs(hor(:)));
        cols = round((cols +(scaling.*hor)));
        rows = round((rows +(scaling.*ver)));
        frame = getframe(fig);
        writeVideo(output, frame);
    end
    close(output);
end

