function demo_lucas_kanade()
%     % for Sphere
    im1 = im2double(rgb2gray(imread('sphere1.ppm')));
    im2 = im2double(rgb2gray(imread('sphere2.ppm')));
    %For Synth
%     im1 = im2double(imread('synth1.pgm'));
%     im2 = im2double(imread('synth2.pgm'));
    
    sects = 15;
    flow = lucas_kanade(im1,im2,sects);
    flow = flow';


    num_instances = floor(h / sects)^2;
    h_ad = (floor(h/sects)*sects);
    w_ad = (floor(w/sects)*sects);
    

    [x, y] = meshgrid(8:15:w_ad, 8:15:h_ad);

    % Get the plottable Image
    % for Sphere
    pltim = imread('sphere1.ppm');
    % for synth
%     pltim = imread('synth1.pgm');
    imshow(pltim);
    hold on;
    quiver(reshape(x, [], 1), reshape(y, [], 1), flow(:, 1), flow(:, 2), 'color', [1, 1, 1]);
    
    %General Title
    title('Lucas Kanade Optical Flow');
    
    %Specific Titles
    %title('Lucas Kanade Optical Flow of Synth');
    %title('Lucas Kanade Optical Flow of a Sphere');
    

end

