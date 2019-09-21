function imOut = compute_LoG(image, LOG_type)
image_double = double(image);
switch LOG_type
    case 1
        %method 1
        h_gaussian = fspecial("gaussian", [5,5], 0.5);
        % for greyscale image        
        imOut = conv2(image_double, h_gaussian, "same");
        % by default alpha is 0.2
        h_laplacian = fspecial("laplacian");
         imOut = conv2(imOut, h_laplacian, "same");
%          or we can do it manually with second order deriative
%          [dx, dy] = gradient(imOut);
%         [dx2, ~] = gradient(dx);
%        [~, dy2] = gradient(dy);
%         imOut = (dx2 + dy2);
    case 2
        % method 2
        h_log = fspecial("log", [5,5], 0.5);
        imOut = conv2(image_double, h_log, "same");
    case 3
        %method 3
        % the best ratio seems to be 100
        sigma1 = 0.1; sigma2 = sigma1 * 100;
        h_gaussian1 = fspecial("gaussian", [5,5], sigma1);
        h_gaussian2 = fspecial("gaussian", [5,5], sigma2);
        imOut = conv2(image_double, h_gaussian1 - h_gaussian2, "same");

end
end

