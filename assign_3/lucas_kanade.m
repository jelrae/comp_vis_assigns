function lucas_kanade(image1, image2, sects)
    if nargin == 2
        sects = 15;
    end
    % get the image size and new sizes
    im1 = im2double(rgb2gray(image1));
    im2 = im2double(rgb2gray(image2));
    [h,w] = size(im1);
    h_adjust = (floor(h/sects)*sects);
    w_adjust = (floor(w/sects)*sects);

    im1 = im1(1:h_adjust, 1:w_adjust);
    im2 = im2(1:h_adjust, 1:w_adjust);
    
    

    window1 = mat2cell(im1, repelem(sects, h_adjust/sects), repelem(sects, w_adjust/sects));
    window2 = mat2cell(im2, repelem(sects, h_adjust/sects), repelem(sects, w_adjust/sects));
    flow_h = zeros(h_adjust/sects,w_adjust/sects);
    flow_w = zeros(h_adjust/sects,w_adjust/sects);
    % get flow information for horizontal and vertical directions
    for i = 1:h_adjust/sects
        for j= 1:w_adjust/sects
            v = solve_sys(window1{i,j},window2{i,j});
            flow_h(i,j) = v(1);
            flow_w(i,j) = v(2);
        end
    end
    figure(1);
    imshow(image1);
    hold on;
    quiver(sects*(1:h_adjust/sects),sects*(1:w_adjust/sects),flow_h,flow_w);    
end




function v = solve_sys(window1, window2)
    [Ix, Iy] = imgradientxy(window1);
    A = [Ix(:), Iy(:)];
    b = window1(:) - window2(:);
    v = inv(A' * A) * A'* b;
end