% read files
clear; close all;
%D = 'person_toy';
D = 'pingpong';
%S = dir(fullfile(D,'*.jpg')); % pattern to match filenames.
S = dir(fullfile(D,'*.jpeg'));
for k = 1:numel(S)
    F = fullfile(D,S(k).name);
    I = imread(F);
    %imshow(I)
    images(:,:,:,k) = I;
end

%tracking_attempt('person_toy',images,15);
tracking_attempt('pingpong',images,15);