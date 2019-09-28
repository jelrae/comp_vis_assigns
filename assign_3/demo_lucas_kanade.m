function demo_lucas_kanade()
    i1 = im2double(rgb2gray(imread('sphere1.ppm')));
    i2 = im2double(rgb2gray(imread('sphere2.ppm')));
    
    flow = lucas_kanade(i1,i2);
    flow = flow';
    
    [h, w] = size(i1);

    h_fixed = floor(h / 15) * 15;
    w_fixed = floor(w / 15) * 15;

    [x, y] = meshgrid(8:15:w_fixed, 8:15:h_fixed);

    imagesc(unique(x), unique(y), i1);
    hold on;
    quiver(reshape(x, [], 1), reshape(y, [], 1), flow(:, 1), flow(:, 2), 'color', [1, 1, 1]);

end
