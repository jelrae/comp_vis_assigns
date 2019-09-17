albedo_img_path = "ball_albedo.png";
shading_img_path = "ball_shading.png";
reconstructed = iid_image_formation(albedo_img_path, shading_img_path);
imwrite(reconstructed, "ball_reconstructed.png")

albedo_img_green_path = "ball_albedo_green.png";
reconstructed_green = iid_image_formation(albedo_img_green_path, shading_img_path);
imwrite(reconstructed_green, "ball_reconstructed_green.png")

%% plotting figures
figure(1);

subplot(231);
imshow("ball_albedo.png");
title("albedo");
subplot(232);
imshow("ball_shading.png");
title("shading");
subplot(233);
imshow(reconstructed_img);
title("reconstructed");

subplot(234);
imshow("ball_albedo_green.png");
title("albedo");

subplot(235);
imshow("ball_shading.png");
title("shading");

subplot(236);
imshow(reconstructed_green);
title("reconstructed_green");