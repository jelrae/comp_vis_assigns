function [ height_map ] = construct_surface( p, q, path_type )
%CONSTRUCT_SURFACE construct the surface function represented as height_map
%   p : measures value of df / dx
%   q : measures value of df / dy
%   path_type: type of path to construct height_map, either 'column',
%   'row', or 'average'
%   height_map: the reconstructed surface


if nargin == 2
    path_type = 'column';
end

[h, w] = size(p);
height_map = zeros(h, w);

switch path_type
    case 'column'
        % =================================================================
        % YOUR CODE GOES HERE
        % top left corner of height_map is zero
        % for each pixel in the left column of height_map
        %   height_value = previous_height_value + corresponding_q_value
        
        % for each row
        %   for each element of the row except for leftmost
        %       height_value = previous_height_value + corresponding_p_value
        
        first_col_height = 0;
        for y = 2:h
            first_col_height = first_col_height + q(y, 1);
            height_map(y, 1) = first_col_height;
            
            row_height = first_col_height;
            for x = 2:w
                row_height = row_height + p(y, x);
                height_map(y, x) = row_height;
            end
        end
       
        % =================================================================
        
               
    case 'row'
        
        % =================================================================
        % YOUR CODE GOES HERE
        first_row_height = 0;
        for x = 2:w
            first_row_height = first_row_height + p(1, x);
            height_map(1, x) = first_row_height;
            
            col_height = first_row_height;
            for y = 2:h
                col_height = col_height + q(y, x);
                height_map(y, x) = col_height;
            end
        end

        % =================================================================
          
    case 'average'
        
        % =================================================================
        % YOUR CODE GOES HERE

        col_first = construct_surface(p, q, 'col');
        row_first = construct_surface(p, q, 'row');
        height_map = (col_first + row_first) / 2;
        % =================================================================
end

end

