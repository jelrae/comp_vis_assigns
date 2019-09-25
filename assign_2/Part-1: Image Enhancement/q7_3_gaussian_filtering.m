% 4. Try denoising image1 gaussian.jpg using a Gaussian ?ltering. 
% Choose an appropriate window size and standard deviation and justify your choice. 
% Show the denoised images in your report.

original_img = imread("image1.jpg");
gaussian_img = imread("image1_gaussian.jpg");


%% gaussian filtering with sigma = 0.6, 0.8, 1.0, 1.2 / window 3, 3, 3, 3, respectively
gauss1 = denoise(gaussian_img, 'gaussian', 0.4, 3);

gauss2= denoise(gaussian_img, 'gaussian', 0.8, 5);

gauss3= denoise(gaussian_img, 'gaussian', 2, 5);

gauss4 = denoise(gaussian_img, 'gaussian', 4, 7);

montage({original_img, gaussian_img, gauss1, gauss2, gauss3, gauss4});
