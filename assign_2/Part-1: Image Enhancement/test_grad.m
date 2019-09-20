image = imread('./images/image2.jpg');
%imshow(image);
[Gx, Gy, im_magnitude,im_direction] = compute_gradient(image);
imglist = {Gx, Gy, im_magnitude, im_direction};
montage(imglist);
