function flow =  opticFlow(im1, im2, sects = 15)
    % get the image size and new sizes
    [h,w] = size(im1);
    h_adjust = floor(h/sects)*sects;
    w_adjust = floor(w/sects)*sects;
    
    % Resize the image into a windowble shape
    offset_h = floor((h-h_adjest)/2);
    offset_w = floor((w-w_adjest)/2);
    im1 = im1(offset_h:h_adjust, offset_w:w_adjust);
    im2 = im2(offset_h:h_adjust, offset_w:w_adjust);
    
    %Make the subsections
    im1 = reshape(im1,sects,sects,[]);
    im2 = reshape(im2,sects,sects,[]);
    
end