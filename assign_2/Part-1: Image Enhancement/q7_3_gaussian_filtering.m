% 4. Try denoising image1 gaussian.jpg using a Gaussian ?ltering. 
% Choose an appropriate window size and standard deviation and justify your choice. 
% Show the denoised images in your report.

gaussian_img = imread("image1_gaussian.jpg");

%% gaussian filtering with varying values of sigma, window = 3
subplot(3,3,1)
gauss1 = denoise(gaussian_img, 'gaussian', 1, 3);
imshow(gauss1)
title("gaussian filtering where sigma = 1, window size = 3")

subplot(3,3,2)
gauss2 = denoise(gaussian_img, 'gaussian', 2, 3);
imshow(gauss2)
title("gaussian filtering where sigma = 2, window size = 3")

subplot(3,3,3)
gauss3 = denoise(gaussian_img, 'gaussian', 3, 3);
imshow(gauss3)
title("gaussian filtering where sigma = 3, window size = 3")

%% gaussian filtering with varying values of sigma, window = 5
subplot(3,3,4)
gauss4 = denoise(gaussian_img, 'gaussian', 1, 5);
imshow(gauss4)
title("gaussian filtering where sigma = 1, window size = 5")

subplot(3,3,5)
gauss5 = denoise(gaussian_img, 'gaussian', 2, 5);
imshow(gauss5)
title("gaussian filtering where sigma = 2, window size = 5")

subplot(3,3,6)
gauss6 = denoise(gaussian_img, 'gaussian', 3, 5);
imshow(gauss6)
title("gaussian filtering where sigma = 3, window size = 5")

%% gaussian filtering with varying values of sigma, window = 7
subplot(3,3,7)
gauss7 = denoise(gaussian_img, 'gaussian', 1, 7);
imshow(gauss7)
title("gaussian filtering where sigma = 1, window size = 7")

subplot(3,3,8)
gauss8 = denoise(gaussian_img, 'gaussian', 2, 7);
imshow(gauss8)
title("gaussian filtering where sigma = 2, window size = 7")

subplot(3,3,9)
gauss9 = denoise(gaussian_img, 'gaussian', 3, 7);
imshow(gauss9)
title("gaussian filtering where sigma = 3, window size = 7")
