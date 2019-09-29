function flow =  opticFlow(im1, im2, sects)
    
    if nargin == 2
        sects = 15;
    end
    
    % get the image size and new sizes
    [h,w] = size(im1);
    h_adjust = (floor(h/sects)*sects);
    w_adjust = (floor(w/sects)*sects);
    
    % Resize the image into a windowble shape
    offset_h = floor((h-h_adjust)/2);
    offset_w = floor((w-w_adjust)/2);
    
    %Offset to just loose the sides than the full bit
%     im1 = im1(offset_h:h_adjust+offset_h-1, offset_w:w_adjust+offset_w-1);
%     im2 = im2(offset_h:h_adjust+offset_h-1, offset_w:w_adjust+offset_w-1);
    
    im1 = im1(1:h_adjust, 1:w_adjust);
    im2 = im2(1:h_adjust, 1:w_adjust);
    
    
    %Pad the matrix
%     im1_padded =  zeros(h_adjust+2, w_adjust+2);
%     im2_padded =  zeros(h_adjust+2, w_adjust+2);
%     
%     im1_padded(2:h_adjust+1, 2:w_adjust+1) = im1;
%     im2_padded(2:h_adjust+1, 2:w_adjust+1) = im2;
    
    %Make the subsections
    window1 = reshape(im1,sects,sects,[]);
    window2 = reshape(im2,sects,sects,[]);
    %My friend told me about this, she jsut gave it to me.  Not sure if we
    %should use
    %window1 = mat2cell(image1, repelem(sects, h_adjust/sects), repelem(sects, w_adjust/sects));
    %window2 = mat2cell(image1, repelem(sects, h_adjust/sects), repelem(sects, w_adjust/sects));
    
    %Make Ix and Iy
    dx = [1 0 -1; 1 0 -1; 1 0 -1];
    dy = dx';
    
    % Attempt 1
    Iy = conv2(im1, dy, 'same');
    Ix = conv2(im1, dx, 'same');
    Ix = reshape(Ix,sects,sects,[]);
    Iy = reshape(Iy,sects,sects,[]);
     

%     %Attempt 2 works even less
%     Ix = zeros(size(window1));
%     Iy = zeros(size(window1));
% 
%     for z = 1:1:size(window1,3)
%         Ix(:,:,z) = conv2(window1(:,:,z), dx, 'same');
%         Iy(:,:,z) = conv2(window1(:,:,z), dy, 'same');
%     end
    
    Ix = reshape(Ix,[],1,size(Ix,3));
    Iy = reshape(Iy,[],1,size(Iy,3));    
    
    A = [Ix, Iy];
    
    %Make I_t
    %Make into vectors
    array1 = reshape(window1,[],1,size(window1,3));
    array2 = reshape(window2,[],1,size(window2,3));
    b = -1.*(array2-array1);
    
    %Find the Flow
    
    flow = zeros(2,size(A,3));
    
    for z = 1:1:size(A,3)
        flow(:,z) = inv(A(:,:,z)'*A(:,:,z))*A(:,:,z)'*b(:,:,z);
    end
    
end