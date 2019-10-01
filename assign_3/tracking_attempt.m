function tracking_attempt(imgs, sects)
    
    videoObject = VideoWriter(sprintf('result_tracking/tracking1.avi'));
    videoObject.FrameRate = 10;
    open(videoObject);
    time_inteval = 10;
    [h,w,~,count_images] = size(imgs);
    % detect interesting points
    [rows, cols, corners_1, Ix, Iy] = harris_corner_detector(imgs(:,:,:,1));
    scaling = 5;
    
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
        
        flow = zeros(size(corners,1),2);

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
            patch_1(:,:) = img(x_low:x_high, y_low:y_high);
            patch_2(:,:) = img2(x_low:x_high, y_low:y_high); 
            flow(j,:) = lucas_kanade(patch_1, patch_2, 15);
            %end
        end    
         
%         for k = 1:length(rows)
%             v = solve_sys(patches_1(:,:,k), patches_2(:,:,k));
%             flow_h(k) = v(1);
%             flow_w(k) = v(2);
%         
%         end
        
        image = imgs(:,:,:,i);
        fig = figure(1);
        imshow(image);
        hold on;
        h = flow(:,1);
        v = flow(:,2);
        quiver(cols, rows, h, v, 'color', [0, 0, 1]);
        cols = round((cols +(scaling.*h)));
        rows = round((rows +(scaling.*v)));
        fr = getframe(fig);
        writeVideo(videoObject, fr);
    end
    close(videoObject);
end

function v = solve_sys(window1, window2)
    [Ix, Iy] = imgradientxy(window1);
    A = [Ix(:), Iy(:)];
    b = window1(:) - window2(:);
%   v = inv(A' * A) * A'* b;
    v = (A' * A)\A' * b;

end