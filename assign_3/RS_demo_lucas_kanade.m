function demo_lucas_kanade()
    %i1 = im2double(rgb2gray(imread('sphere1.ppm')));
    %i2 = im2double(rgb2gray(imread('sphere2.ppm')));
    i1 = imread('sphere1.ppm');
    i2 = imread('sphere2.ppm');
    sects = 15;
    lucas_kanade(i1,i2,sects);
end
