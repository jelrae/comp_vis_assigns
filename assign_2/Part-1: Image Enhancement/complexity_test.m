function complexity_test(sigma, kernel_size)
% function [time1, time2] = complexity_test(sigma, kernel_size)
    I = reshape(1:1:((size(kernel_size,1)+2)^2), size(kernel_size)+2)';
    h = gauss2D(sigma, kernel_size);
    display('The time for 1d')
    apply_filter_1D(I,h)
    display('The time for 2d')
    apply_filter_2D(I,h)
end