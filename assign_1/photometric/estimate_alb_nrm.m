function [ albedo, normal ] = estimate_alb_nrm( image_stack, scriptV, shadow_trick)
%COMPUTE_SURFACE_GRADIENT compute the gradient of the surface
%   image_stack : the images of the desired surface stacked up on the 3rd
%   dimension
%   scriptV : matrix V (in the algorithm) of source and camera information
%   shadow_trick: (true/false) whether or not to use shadow trick in solving
%   	linear equations
%   albedo : the surface albedo
%   normal : the surface normal


[h, w, n] = size(image_stack);
if nargin == 2
    shadow_trick = true;
end

% create arrays for 
%   albedo (1 channel)
%   normal (3 channels)
albedo = zeros(h, w, 1);
normal = zeros(h, w, 3);



% =========================================================================
% YOUR CODE GOES HERE
ind_x = 1:w;
ind_y = 1:h;
ind_z = 1:n;

% for each point in the image array
for x = ind_x
    for y = ind_y 
        %   stack image values into a vector i
        i = reshape(image_stack(x,y,:), [5,1]);
        %   construct the diagonal matrix scriptI
        scriptI = diag(i);
        %   solve scriptI * scriptV * g = scriptI * i to obtain g for this point
        [g,R] = linsolve(mtimes(scriptI,scriptV),mtimes(scriptI,i));
        %   albedo at this point is |g|
        albedo(x,y) = norm(g);
        %   normal at this point is g / |g|
        normal(x,y,:) = g/norm(g);
    end
end


% =========================================================================

end