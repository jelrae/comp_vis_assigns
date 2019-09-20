function [Gx, Gy, im_magnitude,im_direction] = compute_gradient(image)
    image = double(image);
    filter = [1 0 -1; 2 0 -2; 1 0 -1];
    Gx = conv2(image, filter,'same');
    Gy = conv2(image, filter','same');
    im_magnitude = rescale(sqrt(Gx.^2+ Gy.^2));
    im_direction = atan(Gy./Gx);
    Gx = rescale(Gx);
    Gy = rescale(Gy);
end

