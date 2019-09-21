image = imread('./images/image2.jpg');
img1 = compute_LoG(image, 1);
img2 = compute_LoG(image, 2);
img3 = compute_LoG(image, 3);
montage({image, img1, img2, img3});
