clear;
img_path = "pingpong/0000.jpeg";
image = imread(img_path);
image = rgb2gray(image);
image = double(image);

%% calculate gradient
% filter along x and y axis, assume the size of window is 3 by 3
dx = [1 0 -1; 1 0 -1; 1 0 -1];
dy = dx';
gaussian_size = 3;sigma = 2;
Ix = conv2(image, dx, 'same');   
Iy = conv2(image, dy, 'same');
% gaussian size and sigma
gaussian_filter = fspecial('gaussian',9,2);
Ix2 = conv2(Ix.^2, gaussian_filter, 'same');
Iy2 = conv2(Iy.^2, gaussian_filter, 'same');
%% computer cornerness for each pixel, according equation 10
A = Ix2;
C = Iy2;
B = Ix .* Iy;
H = (A.*C - B.^2) - 0.04*(A + C).^2;
% R11 = (Ix2.*Iy2 - Ixy.^2) - k*(Ix2 + Iy2).^2;
%% find corner points by finding local maxima above threshold
[number_rows, number_columns] = size(H);
res_rows = [];
res_cols = [];
res_cornerness = [];
H = rescale(H);
% expand the H matrix by duplicating to deal with boundary
H = padarray(H, [1,1], "replicate");

threshold = 0.89;
for i=2:number_rows
    for j  = 2: number_columns
        local_area = H(i-1:i+1, j-1:j+1);
        if H(i, j) >= max(local_area, [], "all") && H(i, j) >= threshold
            res_rows = [res_rows, i];
            res_cols = [res_cols,j];
            res_cornerness = [res_cornerness, H(i, j)];
        end
    end
end


% figure(1); subplot(121); imshow(Ix); title("Ix and Iy");subplot(122); imshow(Iy);
% hold off;
disp(length(res_cornerness));
figure(2);
imshow(img_path);
hold on;
plot(res_cols, res_rows, 'r*');






        
            
            


