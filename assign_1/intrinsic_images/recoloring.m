clear;
%% get true color
[img_data, map, alpha] = imread("ball_albedo.png");   
img_data = im2double(img_data);
true_color_double = zeros(1,3);

for i=1:3
       true_color_double(i) = mean(nonzeros(img_data(:,:, i)));
end
% convert to uint8
true_color_uint8 = im2uint8(true_color_double);
disp(true_color_uint8);

%% recoloring
recolor = [0,255,0];
[h,w,d] = size(img_data);
recolored_img = zeros(h,w,d);
for i=1:h
    for j=1:w        
        if mean(img_data(i, j)) ~= 0
            % we only change colored pixels
            recolored_img(i, j, :) = recolor .* reshape(img_data(i,j,:), 1,3);
        end
    end
end
imwrite(recolored_img, "ball_albedo_green.png")



        
         
        
        


