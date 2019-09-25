% % question
% Using your implemented function denoise, try denoising image1 saltpepper.jpg and image1 gaussian.jpg by applying the following ?lters:
% (a) Box ?ltering of size: 3x3, 5x5, and 7x7. 
% (b) Median ?ltering with size: 3x3, 5x5 and 7x7.
% Show the denoised images in your report. Use tables to present your quantitative results.

saltpepper_img = imread("image1_saltpepper.jpg");
gaussian_img = imread("image1_gaussian.jpg");

%denoise saltpepper noise w/ box filters of size 3*3, 5*5, 7*7
bf_33_sp = denoise(saltpepper_img, 'box', 3);
bf_55_sp = denoise(saltpepper_img, 'box', 5);
bf_77_sp = denoise(saltpepper_img, 'box', 7);

%denoise gaussian noise w/ box filters of size 3*3, 5*5, 7*7
bf_33_gauss = denoise(gaussian_img, 'box', 3);
bf_55_gauss = denoise(gaussian_img, 'box', 5);
bf_77_gauss = denoise(gaussian_img, 'box', 7);

%denoise saltpepper noise w/ median filters of size 3*3, 5*5, 7*7
med_33_sp = denoise(saltpepper_img, 'median', 3);
med_55_sp = denoise(saltpepper_img, 'median', 5);
med_77_sp = denoise(saltpepper_img, 'median', 7);

%denoise gaussian noise w/ median filters of size 3*3, 5*5, 7*7
med_33_gauss = denoise(gaussian_img, 'median', 3);
med_55_gauss = denoise(gaussian_img, 'median', 5);
med_77_gauss = denoise(gaussian_img, 'median', 7);

%% subplotting
subplot(4,3,1);
imshow(bf_33_sp);
title('3*3 box filter')
subplot(4,3,2);
imshow(bf_55_sp);
title('5*5 box filter')
subplot(4,3,3);
imshow(bf_77_sp);
title('7*7 box filter')
% % 
subplot(4,3,4);
imshow(med_33_sp);
title('3*3 median filter')
subplot(4,3,5);
imshow(med_55_sp);
title('5*5 median filter')
subplot(4,3,6);
imshow(med_77_sp);
title('7*7 median filter')
% % 
subplot(4,3,7);
imshow(bf_33_gauss);
title('3*3 box filter')
subplot(4,3,8);
imshow(bf_55_gauss);
title('5*5 box filter')
subplot(4,3,9);
imshow(bf_77_gauss);
title('7*7 box filter')

% % 
subplot(4,3,10);
imshow(med_33_gauss);
title('3*3 median filter')
subplot(4,3,11);
imshow(med_55_gauss);
title('5*5 median filter')
subplot(4,3,12);
imshow(med_77_gauss);
title('7*7 median filter')

%%

% Using your implemented function myPSNR, compute the PSNR for every denoised image (12 in total). 
% What is the e?ect of the ?lter size on the PSNR? 
% Report the results in a table and discuss.
saltpepper_img = imread("image1_saltpepper.jpg");
gaussian_img = imread("image1_gaussian.jpg");
original_img = imread("image1.jpg");


% % compute PSNR for saltpepper noise treated with box filters
psnr_bf_33_sp = myPSNR(original_img, bf_33_sp);
psnr_bf_55_sp = myPSNR(original_img, bf_55_sp);
psnr_bf_77_sp = myPSNR(original_img, bf_77_sp);

% % compute PSNR for saltpepper noise treated with median filters
psnr_med_33_sp = myPSNR(original_img, med_33_sp);
psnr_med_55_sp = myPSNR(original_img, med_55_sp);
psnr_med_77_sp = myPSNR(original_img, med_77_sp);

% % compute PSNR for gaussian noise treated with box filters
psnr_bf_33_gauss = myPSNR(original_img, bf_33_gauss);
psnr_bf_55_gauss = myPSNR(original_img, bf_55_gauss);
psnr_bf_77_gauss = myPSNR(original_img, bf_77_gauss);

% % compute PSNR for gaussian noise treated with median filters
psnr_med_33_gauss = myPSNR(original_img, med_33_gauss);
psnr_med_55_gauss = myPSNR(original_img, med_55_gauss);
psnr_med_77_gauss = myPSNR(original_img, med_77_gauss);
