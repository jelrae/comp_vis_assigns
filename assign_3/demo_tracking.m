% read files
clear; close all;
D = 'person_toy';
S = dir(fullfile(D,'*.jpg')); % pattern to match filenames.

for k = 1:numel(S)
    F = fullfile(D,S(k).name);
    I = imread(F);
    %imshow(I)
    images(:,:,:,k) = I;
end

tracking(images);