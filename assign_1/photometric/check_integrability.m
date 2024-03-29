function [ p, q, SE ] = check_integrability( normals )
%CHECK_INTEGRABILITY check the surface gradient is acceptable
%   normals: normal image
%   p : df / dx
%   q : df / dy
%   SE : Squared Errors of the 2 second derivatives

% initalization
[h, w, n] = size(normals);
p = zeros(h, w, 1);
q =  zeros(h, w, 1);
SE =  zeros(h, w, 1);

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
        p(y,x) = normals(y,x,1)/normals(y,x,3);
% q measures value of df / dy
        q(y,x) = normals(y,x,2)/normals(y,x,3);
    end
end
% ========================================================================

p(isnan(p)) = 0;
q(isnan(q)) = 0;

% ========================================================================
% YOUR CODE GOES HERE

for y = ind_y
    if y == 1
        p_up = p(y+1,x);
        p_down = 0;
        q_up = q(y+1,x);
        q_down = 0;
    elseif y == ind_y(end)
        p_up = 0;
        p_down = p(y-1,x);
        q_up = 0;
        q_down = q(y-1,x);
    else
        p_up = p(y+1,x);
        p_down = p(y-1,x);
        q_up = q(y+1,x);
        q_down = q(y-1,x);
    end
    for x = ind_x
        % approximate second derivate by neighbor difference
        if x == 1
            p_left = 0;
            p_right = p(y,x+1);
            q_left = 0;
            q_right = q(y,x+1);
        elseif x == ind_x(end)
            p_left =  p(y,x-1);
            p_right = 0;
            q_left =  q(y,x-1);
            q_right = 0;
        else
            p_left = p(y,x-1);
            p_right = p(y,x+1);
            q_left = q(y,x-1);
            q_right = q(y,x+1);
        end
        % and compute the Squared Errors SE of the 2 second derivatives SE
        %disp([x,y,z])
        SE(y,x) = (((p_right - p_left + p_up - p_down)) + ((q_right - q_left + q_up - q_down)))^2; %maybe divide them by 2?
    end
end


% ========================================================================




end

