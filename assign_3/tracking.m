function tracking(imgs)
    % convert the image to gray scale
    [count_rows,count_cols,~,count_images] = size(imgs);
    h1 = ones(count_rows, count_cols);
    h2 = ones(count_rows, count_cols);
    
    for i = 1:count_images-1
        % detect harris corner
        img = imgs(:,:,:,i);
        img2 = imgs(:,:,:,i+1);
        [rows, cols, corners_1, Ix, Iy] = harris_corner_detector(img);
        for j = 1: length(rows)
            h1(rows(j), cols(j)) = img(rows(j), cols(j));
        end
        [rows, cols, corners_2, Ix, Iy] = harris_corner_detector(img2);
        for k = 1: length(rows)
            h2(rows(k), cols(k)) = img2(rows(k), cols(k));
        end
        [X,Y,U1,U2] = lucas_kanade(h1,h2,15,false);
        figure(1);
        imshow(img);
        hold on;
        quiver(X,Y,U2,U1); 
    end
    
 
end