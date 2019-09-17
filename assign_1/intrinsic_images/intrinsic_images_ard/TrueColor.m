% algorithm to find the true color of the ball albedo
[img_data, map, alpha] = imread("ball_albedo.png");   

% retrieve R, G, and B color spaces.
R = img_data(:,:,1);
G = img_data(:,:,2);
B = img_data(:,:,3);

%We're assuming the albedo is colored uniformly
%We can find the value per color space by taking the maximum value for each color space. 
Rmax = max(max(R));
Gmax = max(max(G));
Bmax = max(max(B));

%This yields a true color in RGB space of [184, 141, 108]
Rmax
Gmax
Bmax



