% Choose an appropriate window size and standard deviation and justify your choice. 
% Show the denoised images in your report.

gaussian_img = imread("image1_gaussian.jpg");
original_img = imread("image1.jpg");

% %% gaussian filtering with varying values of sigma, window = 3
% 
gauss2 = denoise(gaussian_img, 'gaussian', 0.2, 3);
myPSNR(original_img, gauss2)

gauss4 = denoise(gaussian_img, 'gaussian', 0.4, 3);
myPSNR(original_img, gauss4)

gauss6 = denoise(gaussian_img, 'gaussian', 0.6, 3);
myPSNR(original_img, gauss6)

gauss8 = denoise(gaussian_img, 'gaussian', 0.8, 3);
myPSNR(original_img, gauss8)

gauss10 = denoise(gaussian_img, 'gaussian', 1, 3);
myPSNR(original_img, gauss10)

gauss2 = denoise(gaussian_img, 'gaussian', 1.2, 3);
myPSNR(original_img, gauss2)

gauss4 = denoise(gaussian_img, 'gaussian', 1.4, 3);
myPSNR(original_img, gauss4)

gauss6 = denoise(gaussian_img, 'gaussian', 1.6, 3);
myPSNR(original_img, gauss6)

gauss8 = denoise(gaussian_img, 'gaussian', 1.8, 3);
myPSNR(original_img, gauss8)

gauss10 = denoise(gaussian_img, 'gaussian', 2, 3);
myPSNR(original_img, gauss10)

% % gaussian filtering with varying values of sigma, window = 5
% 
gauss2 = denoise(gaussian_img, 'gaussian', 0.2, 5);
myPSNR(original_img, gauss2)

gauss4 = denoise(gaussian_img, 'gaussian', 0.4, 5);
myPSNR(original_img, gauss4)

gauss6 = denoise(gaussian_img, 'gaussian', 0.6, 5);
myPSNR(original_img, gauss6)

gauss8 = denoise(gaussian_img, 'gaussian', 0.8, 5);
myPSNR(original_img, gauss8)

gauss10 = denoise(gaussian_img, 'gaussian', 1, 5);
myPSNR(original_img, gauss10)

gauss2 = denoise(gaussian_img, 'gaussian', 1.2, 5);
myPSNR(original_img, gauss2)

gauss4 = denoise(gaussian_img, 'gaussian', 1.4, 5);
myPSNR(original_img, gauss4)

gauss6 = denoise(gaussian_img, 'gaussian', 1.6, 5);
myPSNR(original_img, gauss6)

gauss8 = denoise(gaussian_img, 'gaussian', 1.8, 5);
myPSNR(original_img, gauss8)

gauss10 = denoise(gaussian_img, 'gaussian', 2, 5);
myPSNR(original_img, gauss10)

% gaussian filtering with varying values of sigma, window = 7

gauss2 = denoise(gaussian_img, 'gaussian', 0.2, 7);
myPSNR(original_img, gauss2)

gauss4 = denoise(gaussian_img, 'gaussian', 0.4, 7);
myPSNR(original_img, gauss4)

gauss6 = denoise(gaussian_img, 'gaussian', 0.6, 7);
myPSNR(original_img, gauss6)

gauss8 = denoise(gaussian_img, 'gaussian', 0.8, 7);
myPSNR(original_img, gauss8)

gauss10 = denoise(gaussian_img, 'gaussian', 1, 7);
myPSNR(original_img, gauss10)

gauss2 = denoise(gaussian_img, 'gaussian', 1.2, 7);
myPSNR(original_img, gauss2)

gauss4 = denoise(gaussian_img, 'gaussian', 1.4, 7);
myPSNR(original_img, gauss4)

gauss6 = denoise(gaussian_img, 'gaussian', 1.6, 7);
myPSNR(original_img, gauss6)

gauss8 = denoise(gaussian_img, 'gaussian', 1.8, 7);
myPSNR(original_img, gauss8)

gauss10 = denoise(gaussian_img, 'gaussian', 2, 7);
myPSNR(original_img, gauss10)








