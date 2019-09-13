function visualize(input_image)
    % if it is not gray scale transformed img
    % if it is gray scale, show 4 different gray imgs
    s = size(input_image);
    % grayscale
    if s(3) == 4
        imglist = {input_image(:,:,1), input_image(:,:,2), 
                    input_image(:,:,3), input_image(:,:,4)}
        montage(imglist);
    else
        imshow(input_image);
    end
end

