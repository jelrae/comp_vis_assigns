function demo_lucas_kanade()
    im1 = im2double(rgb2gray(imread('sphere1.ppm')));
    im2 = im2double(rgb2gray(imread('sphere2.ppm')));
    
    sects = 15;
    flow = lucas_kanade(im1,im2,sects);
    flow = flow';

    [h, w] = size(im1);

    num_instances = floor(h / sects)^2;
    h_ad = (floor(h/sects)*sects);
    w_ad = (floor(w/sects)*sects);
    
%     quiver((1:1:num_instances)',(1:1:num_instances)', flow(:,1), flow(:,2))
    
    %Friends code

    [x, y] = meshgrid(8:15:w_ad, 8:15:h_ad);

%     imagesc(unique(x), unique(y), im1);
    imshow(im1(1:h_ad,1:w_ad));
    hold on;
    quiver(reshape(x, [], 1), reshape(y, [], 1), flow(:, 1), flow(:, 2), 'color', [1, 1, 1]);

end
