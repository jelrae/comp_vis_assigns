function apply_filter(I, h)
    padded = zeros(size(I)+2);
    padded(2:end-1,2:end-1) = I;
    output = zeros(size(I));
    [rw, col] = size(I); 
    offset = floor(size(h,1)/2);
    hT = h';
    tic
    for i = 1:1:100000
        for r = 1:1:rw
            for c = 1:1:col
                output(r,c) = sum(sum(padded(r+1-offset:r+1+offset,c+1-offset:c+1+offset)*h*hT));
            end
        end
    end
    toc
%     if convol:
%         for r in 1:1:rw:
%             for c in 1:1:col:
%                 
%             end
%         end
%     else 
%         
%         for r in rw:-1:1:
%             for c in col:-1:1:
%                 
%             end
%         end
%     end
end