function [ p, q, SE ] = check_integrability( normals )
%CHECK_INTEGRABILITY check the surface gradient is acceptable
%   normals: normal image
%   p : df / dx
%   q : df / dy
%   SE : Squared Errors of the 2 second derivatives

% initalization
p = zeros(size(normals));
q = zeros(size(normals));
SE = zeros(size(normals));

% ========================================================================
% YOUR CODE GOES HERE
[h, w, n] = size(normals);
ind_x = 1:w;
ind_y = 1:h;
ind_z = 1:n;

% Compute p and q, where
for x = ind_x
    for y = ind_y 
% p measures value of df / dx
        p(x,y) = normals(x,y,1)/normals(x,y,3);
% q measures value of df / dy
        q(x,y) = normals(x,y,2)/normals(x,y,3);
    end
end
% ========================================================================

p(isnan(p)) = 0;
q(isnan(q)) = 0;

% ========================================================================
% YOUR CODE GOES HERE

for z = ind_z
    for y = ind_y
        for x = ind_x
            % approximate second derivate by neighbor difference
            if x == 1  
                p_left = 0;
                p_right = p(x+1,y,z);
                q_left = 0;
                q_right = q(x+1,y,z);
            elseif x == ind_x(end)
                p_left =  p(x-1,y,z);
                p_right = 0;
                q_left =  q(x-1,y,z);
                q_right = 0;
            else
                p_left = p(x-1,y,z);
                p_right = p(x+1,y,z);
                q_left = q(x-1,y,z);
                q_right = q(x+1,y,z);
            end
            % and compute the Squared Errors SE of the 2 second derivatives SE
            %disp([x,y,z])
            SE(x,y,z) = (((p_right - p_left)/2) + ((p_right - p_left)/2))^2;
        end
    end


% ========================================================================




end

