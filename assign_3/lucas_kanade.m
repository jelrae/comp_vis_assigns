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
    
    im1 = im1(1:h_adjust, 1:w_adjust);
    im2 = im2(1:h_adjust, 1:w_adjust);
    
    %Make windows with cells cause arrays dont seem to work
    w1 = mat2cell(im1, repelem(sects, h_adjust/sects), repelem(sects, w_adjust/sects));
    w2 = mat2cell(im2, repelem(sects, h_adjust/sects), repelem(sects, w_adjust/sects));
    
    a1 = cellfun(@(w1) reshape(w1',[],1), w1, 'UniformOutput', false);
    a2 = cellfun(@(w2) reshape(w2',[],1), w2, 'UniformOutput', false);
    
    b = cellfun(@(a2,a1) a2-a1, a2, a1, 'UniformOutput', false);
    
    % get the derivaties
    [wgradx, wgrady] = cellfun(@imgradient, w1, 'UniformOutput', false);
    
    wgradx = cellfun(@(wgradx) reshape(wgradx',[],1), wgradx, 'UniformOutput', false);
    wgrady = cellfun(@(wgrady) reshape(wgrady',[],1), wgrady, 'UniformOutput', false);
    
    %Construct A
    A = cellfun(@(wgradx,wgrady) [wgradx, wgradx], wgradx, wgrady, 'UniformOutput', false);
    
    %Solve system of equations
    flow = cellfun(@(A,b) inv(A'*A)*A'*-b, A, b, 'UniformOutput', false);
    
    flow = reshape(flow, [],1);
    flow = [flow{:}];
end