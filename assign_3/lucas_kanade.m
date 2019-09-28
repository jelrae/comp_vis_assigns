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
    window1 = reshape(im1,sects,sects,[]);
    window2 = reshape(im2,sects,sects,[]);
    %My friend told me about this, she jsut gave it to me.  Not sure if we
    %should use
    %window1 = mat2cell(image1, repelem(sects, h_adjust/sects), repelem(sects, w_adjust/sects));
    %window2 = mat2cell(image1, repelem(sects, h_adjust/sects), repelem(sects, w_adjust/sects));
    
    %Make into vectors
    array1 = reshape(window1,[],1,size(window1,3));
    array2 = reshape(window2,[],1,size(window2,3));
    
    %Make Ix and Iy
    
    %Make It
    b = -1.*(array2.-array1);
    
end