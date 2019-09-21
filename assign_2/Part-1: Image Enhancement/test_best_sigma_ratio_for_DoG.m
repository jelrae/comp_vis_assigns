%method 3
image_double = double(imread('./images/image2.jpg'));

for sigma1 = [0.1, 0.5, 1.0]
    for sigma2 = [0.1, 0.5, 1.0]
    h_gaussian1 = fspecial("gaussian", [5,5], sigma1);
    h_gaussian2 = fspecial("gaussian", [5,5], sigma2);
    imOut = conv2(image_double, h_gaussian1 - h_gaussian2, "same");
    title(sprintf("simg1=%d, sigma2=%d", sigma1, sigma2));
    figure;imshow(imOut);
    end
end
