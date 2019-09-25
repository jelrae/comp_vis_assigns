% Apply a 2d filter to test time
function apply_filter_2D(I, h)
    padded = zeros(size(I)+2);
    padded(2:end-1,2:end-1) = I;
    output = zeros(size(I));
    [rw, col] = size(I); 
    offset = floor(size(h,1)/2);
    tic
    for i = 1:1:100000
        for r = 1:1:rw
            for c = 1:1:col
                output(r,c) = sum(sum(padded(r+1-offset:r+1+offset,c+1-offset:c+1+offset).*h));
            end
        end
    end
    toc
end