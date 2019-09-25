% Check times to see what is faster
function complexity_test(sigma, kernel_size)
    I = reshape(1:1:((size(kernel_size,1)+2)^2), size(kernel_size)+2)';
    h = gauss2D(sigma, kernel_size);
    display('The time for 1d')
    apply_filter_1D(I,h)
    display('The time for 2d')
    h = gauss1D(sigma, kernel_size);
    apply_filter_2D(I,h)
    
    display('The time for 2d')
    h = gauss2D(sigma, kernel_size);
    tic
    for i = 1:1:10000
        C = conv2(I,h);
    end
    toc
    display('The time for 1d')
    h = gauss1D(sigma, kernel_size);
    tic
    for j = 1:1:10000
        C = conv2(h,h,I);
    end
    toc
    
end