function G = gauss2D( sigma , kernel_size )
    %% solution
    one_d = gauss1D(sigma, kernel_size);
    G = one_d'*one_d;
end