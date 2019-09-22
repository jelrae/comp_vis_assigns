% What is the e?ect of the standard deviation on the PSNR? 
% Report the results in a table and discuss.


gaussian_img = imread("image1_gaussian.jpg");

%% PSNR with varying values of sigma, window = 3

gauss1 = denoise(gaussian_img, 'gaussian', 1, 3);
fprintf('PSNR for sigma = 1, window = 3')
psnr_gauss1 = myPSNR(gaussian_img, gauss1);

gauss2 = denoise(gaussian_img, 'gaussian', 3, 3);
fprintf('PSNR for sigma = 3, window = 3')
psnr_gauss2 = myPSNR(gaussian_img, gauss2);

gauss3 = denoise(gaussian_img, 'gaussian', 5, 3);
fprintf('PSNR for sigma = 5, window = 3')
psnr_gauss3 = myPSNR(gaussian_img, gauss3);

gauss4 = denoise(gaussian_img, 'gaussian', 7, 3);
fprintf('PSNR for sigma = 7, window = 3')
psnr_gauss4 = myPSNR(gaussian_img, gauss4);

gauss5 = denoise(gaussian_img, 'gaussian', 12, 3);
fprintf('PSNR for sigma = 12, window = 3')
psnr_gauss4 = myPSNR(gaussian_img, gauss5);


