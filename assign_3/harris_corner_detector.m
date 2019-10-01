function [res_rows, res_cols, res_cornerness, Ix, Iy] = harris_corner_detector(image, threshold)
image = rgb2gray(image);
image = im2double(image);

% gaussian size and sigma
gaussian_size = 3;
sigma = 2;
% cornerness coefficient
K = 0.04;
%% calculate gradient
% filter along x and y axis, assume the size of window is 3 by 3
dx = [1 0 -1; 1 0 -1; 1 0 -1];
dy = dx';
Ix = conv2(image, dx, 'same');
Iy = conv2(image, dy, 'same');

gaussian_filter = fspecial('gaussian',gaussian_size,sigma);
Ix2 = conv2(Ix.^2, gaussian_filter, 'same');
Iy2 = conv2(Iy.^2, gaussian_filter, 'same');
%% computer cornerness for each pixel, according equation 10
A = Ix2;
C = Iy2;
B = Ix .* Iy;
H = (A.*C - B.^2) - K*(A + C).^2;
%% find corner points by finding local maxima above threshold
[number_rows, number_columns] = size(H);
res_rows = [];
res_cols = [];
res_cornerness = [];
% expand the H matrix by duplicating to deal with boundary
H = padarray(H, [1,1], "replicate");

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

end
