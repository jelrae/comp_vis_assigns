function [new_image] = iid_image_formation(IA, IS)
% Function that takes in image albedo(IA) and image shading(IS) and
% reconstructs these components into the original image.

% Then, we make a copy of the IS image
new_image = IS;

new_image(end,end,2) = new_image(end,end,1) .* IA(end,end,2);

new_image(end,end,1) = new_image(end,end,1) .* IA(end,end,1);

new_image(end,end,3) = new_image(end,end,1) .* IA(end,end,3);

imshow(new_image);
