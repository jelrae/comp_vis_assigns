function PSNR = myPSNR(orig_image , approx_image) 

original_img = imread(orig_image); 
enhanced_img = imread(approx_image);

original_img = im2double(original_img);
enhanced_img = im2double(enhanced_img);

%% MSE Section: computing error per pixel
sum_vec = [];
% the errors per pixel will be stored in a vector called sum_vec
[h,w] = size(original_img);
for i=1:h
    for j=1:w
        error = ( original_img(i,j) - enhanced_img(i,j) ).^2;
        %iterate over image.
        %take difference between pixel in noisy and enhanced image, square the difference.
        sum_vec = [sum_vec error];   
        %storing the result in sum_vec variable
        end
    end
sum_of_errors = sum(sum_vec);
%summing the errors in sum_vec

MSE = sum_of_errors ./ (h .* w);
%computing the Mean Squared Error

%% PSNR section
Imax = max(max(original_img));
% obtain maximum pixel value Imax in original image
fraction = (Imax / sqrt(MSE));

PSNR = 20  .* log10(fraction)

% >> myPSNR("image1_saltpepper.jpg", "image1.jpg");
% 
% PSNR =
% 
%    16.1079
% >> myPSNR("image1_gaussian.jpg", "image1.jpg");
% 
% PSNR =
% 
%    20.5835

end

